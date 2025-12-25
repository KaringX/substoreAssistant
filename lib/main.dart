// ignore_for_file: empty_catches, unused_catch_stack

import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:substore_assistant/app/modules/biz.dart';

import 'package:substore_assistant/app/modules/setting_manager.dart';

import 'package:substore_assistant/app/utils/app_lifecycle_state_notify.dart';
import 'package:substore_assistant/app/utils/app_utils.dart';
import 'package:substore_assistant/app/utils/log.dart';
import 'package:substore_assistant/app/utils/path_utils.dart';
import 'package:substore_assistant/app/utils/system_scheme_utils.dart';

import 'package:substore_assistant/app/utils/windows_version_helper.dart';
import 'package:substore_assistant/i18n/strings.g.dart';
import 'package:substore_assistant/screens/home_screen.dart';
import 'package:substore_assistant/screens/launch_failed_screen.dart';
import 'package:substore_assistant/screens/theme_data_dark.dart';
import 'package:substore_assistant/screens/themes.dart';
import 'package:substore_assistant/screens/widgets/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:tray_manager/tray_manager.dart';

import 'package:window_manager/window_manager.dart';
import 'package:windows_single_instance/windows_single_instance.dart';

List<String> processArgs = [];
StartFailedReason? startFailedReason;
String? startFailedReasonDesc;

void main(List<String> args) async {
  processArgs = args;
  WidgetsFlutterBinding.ensureInitialized();

  await LocaleSettings.useDeviceLocale();

  SemanticsBinding.instance.ensureSemantics();

  await run(args);
}

Future<void> run(List<String> args) async {
  try {
    do {
      String profileDir = await PathUtils.profileDir();
      if (profileDir.isEmpty) {
        startFailedReason = StartFailedReason.invalidProfile;
        break;
      }
      await Log.init();
      String buildVersion = AppUtils.getBuildinVersion();
      String exePath = Platform.resolvedExecutable;
      Log.w(
          'launch $buildVersion $exePath, $args, ${Directory.current.absolute.path}, $profileDir');
      String cache = await PathUtils.cacheDir();
      if (cache.isEmpty) {
        startFailedReason = StartFailedReason.invalidProfile;
        break;
      }
      String version = await AppUtils.getPackgetVersion();
      if (buildVersion != version) {
        startFailedReason = StartFailedReason.invalidVersion;
        break;
      }

      if (path.basename(exePath).toLowerCase() !=
          PathUtils.getExeName().toLowerCase()) {
        startFailedReason = StartFailedReason.invalidProcess;
        break;
      }

      const inProduction = bool.fromEnvironment("dart.vm.product");
      if (inProduction) {
        if (Platform.isMacOS) {
          if (!path.isWithin("/Applications", exePath)) {
            startFailedReason = StartFailedReason.invalidInstallPath;
            break;
          }
        }
      }
      if (Platform.isWindows) {
        var tmp = await getTemporaryDirectory();
        if (exePath.contains("UNC/") ||
            exePath.contains("UNC\\") ||
            path.isWithin(tmp.absolute.path, exePath)) {
          startFailedReason = StartFailedReason.invalidInstallPath;
          break;
        }

        if (VersionHelper.instance.majorVersion != 0 &&
            VersionHelper.instance.majorVersion < 10) {
          startFailedReason = StartFailedReason.systemVersionLow;
          startFailedReasonDesc =
              "Current: ${VersionHelper.instance.majorVersion}\nMinimum required: >= 10.0";
          break;
        }
      }
    } while (false);

    await windowManager.ensureInitialized();
    const inProduction = bool.fromEnvironment("dart.vm.product");
    if (inProduction) {
      await windowManager.setResizable(false);
      await windowManager.setMaximizable(false);
    }

    await windowManager.center();

    if (Platform.isWindows) {
      await WindowsSingleInstance.ensureSingleInstance(
          args, "substoreassistant_single_identifier",
          onSecondWindow: (args) async {
        if (await windowManager.isMinimized()) {
          await windowManager.restore();
        }
        await windowManager.focus();
      });
    }

    await SettingManager.init();
    //await AutoUpdateManager.init();
  } catch (err, stacktrace) {
    startFailedReason = StartFailedReason.exception;
    startFailedReasonDesc = err.toString();
    String cmdline = args.toString();
    Log.w("main.run exception: ${err.toString()}, $cmdline");
  }

  runApp(TranslationProvider(
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp>
    with WidgetsBindingObserver, WindowListener, TrayListener {
  static const kMenuOpen = "show_window";
  static const kMenuExit = "exit_app";

  bool _windowVisibleForMac = false;
  bool _trayGrey = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    windowManager.addListener(this);
    windowManager.setPreventClose(true);
    trayManager.addListener(this);
    _setTray(true, false, true);

    AppLifecycleStateNofity.init();
    LocaleSettings.getLocaleStream().listen((event) {});

    AppLifecycleStateNofity.stateLaunch();
    _init();
  }

  @override
  void dispose() async {
    AppLifecycleStateNofity.uninit();
    WidgetsBinding.instance.removeObserver(this);

    windowManager.removeListener(this);
    trayManager.removeListener(this);
    trayManager.destroy();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        AppLifecycleStateNofity.stateResumed("resumed");
        break;
      case AppLifecycleState.inactive:
        AppLifecycleStateNofity.stateInactive("inactive");
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.paused:
        AppLifecycleStateNofity.statePaused("paused");
        break;
      case AppLifecycleState.hidden:
        AppLifecycleStateNofity.stateInactive("hidden");
        break;
    }
  }

  @override
  Future<AppExitResponse> didRequestAppExit() async {
    await _quit();
    return AppExitResponse.cancel;
  }

  @override
  void didHaveMemoryPressure() {}

  @override
  Widget build(BuildContext context) {
    String schemeArg = processArgs.firstWhere(
      (element) {
        return element.trim().startsWith(SystemSchemeUtils.getSchemeWith());
      },
      orElse: () => '',
    );

    List<NavigatorObserver> observers = [];

    observers.add(AppRouteObserver.instance);

    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: Themes())],
        child: Consumer<Themes>(builder: (context, appTheme, _) {
          Provider.of<Themes>(context)
              .setTheme(SettingManager.getConfig().ui.theme, false);
          return Shortcuts(
              shortcuts: const {
                SingleActivator(LogicalKeyboardKey.select): ActivateIntent()
              },
              child: MaterialApp(
                showSemanticsDebugger: false,
                debugShowCheckedModeBanner: false,
                locale: TranslationProvider.of(context).flutterLocale,
                supportedLocales: AppLocaleUtils.supportedLocales,
                localizationsDelegates: GlobalMaterialLocalizations.delegates,
                navigatorObservers: observers,
                home: PopScope(
                    canPop: false,
                    onPopInvokedWithResult: (didPop, result) {},
                    child: startFailedReason != null
                        ? LaunchFailedScreen(
                            startFailedReason: startFailedReason!,
                            startFailedReasonDesc: startFailedReasonDesc,
                          )
                        : HomeScreen(launchUrl: schemeArg.trim())),
                builder: null,
                themeMode: appTheme.themeMode(),
                theme: appTheme.themeData(context),
                darkTheme: ThemeDataDark.theme(context),
              ));
        }));
  }

  @override
  void onWindowClose() {
    Log.d("onWindowClose");
    windowManager.hide();
    _windowVisibleForMac = false;
    AppLifecycleStateNofity.statePaused("close");
  }

  @override
  void onWindowMinimize() {
    _windowVisibleForMac = false;
    Log.d("onWindowMinimize");
    AppLifecycleStateNofity.statePaused("minimize");
  }

  @override
  void onWindowRestore() {
    _windowVisibleForMac = true;
    Log.d("onWindowRestore");
    AppLifecycleStateNofity.stateResumed("restore");
  }

  @override
  void onWindowFocus() {
    if (Platform.isMacOS) {
      if (!_windowVisibleForMac) {
        Log.d("onWindowFocus");
        _windowVisibleForMac = true;
        AppLifecycleStateNofity.stateResumed("restore");
      }
    }
  }

  @override
  void onWindowDeviceShutdown() {
    Log.d("main.dart onWindowDeviceShutdown");
    _quit();
  }

  @override
  void onWindowUserSessionDisconnect() {
    Log.d("main.dart onWindowUserSessionDisconnect");

    _quit();
  }

  void firstShowWindow(bool forceShow) {
    windowManager.waitUntilReadyToShow(null, () async {
      await windowManager.show();
      onWindowRestore();
    });
  }

  Future<void> _init() async {
    Biz.onRequestExit = (() {
      _quit();
    });
    Biz.onEventSubStoreChanged = ((bool connected) {
      if (_trayGrey == !connected) {
        return;
      }
      _setTray(!connected, false, false);
    });
    if (startFailedReason == null) {
      Biz.onEventInitHomeFinish.add(() {
        firstShowWindow(false);
      });

      await Biz.init();
    } else {
      firstShowWindow(true);
    }
  }

  Future<void> _uninit() async {
    await windowManager.hide();

    if (startFailedReason == null) {
      await Biz.uninit();
    }

    await trayManager.destroy();
  }

  Future<void> _quit() async {
    await _uninit();
    Future.delayed(const Duration(seconds: 0), () async {
      await Log.uninit();
      await ServicesBinding.instance.exitApplication(AppExitType.required);
    });
  }

  void _setTray(bool grey, bool destroy, bool quitIfFailed) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      if (destroy || Platform.isLinux) {
        await trayManager.destroy();
      }

      try {
        if (Platform.isWindows) {
          await trayManager.setIcon(
            grey ? 'assets/images/grey_tray.ico' : 'assets/images/tray.ico',
            isTemplate: false,
          );
        } else {
          await trayManager.setIcon(
            grey ? 'assets/images/grey_tray.png' : 'assets/images/tray.png',
            isTemplate: false,
          );
        }
        _trayGrey = grey;
      } catch (err, stacktrace) {
        Log.w("setIcon exception: ${err.toString()}");
        if (quitIfFailed) {
          Future.delayed(const Duration(milliseconds: 1000), () async {
            _quit();
          });
        }
      }
      if (!Platform.isLinux) {
        await trayManager.setToolTip(AppUtils.getName());
      } else {
        _setTrayMenu();
      }
    });
  }

  void _setTrayMenu() async {
    List<MenuItem> items = [
      MenuItem(
        key: kMenuOpen,
        label: t.main.tray.menuOpen,
      ),
      MenuItem(
        key: kMenuExit,
        label: t.main.tray.menuExit,
      )
    ];

    await trayManager.setContextMenu(Menu(items: items));
    if (!Platform.isLinux) {
      await trayManager.popUpContextMenu(bringAppToFront: true);
    }
  }

  @override
  void onTrayIconMouseDown() async {
    if (await windowManager.isMinimized()) {
      await windowManager.restore();
    } else {
      await windowManager.show();
      onWindowRestore();
    }
  }

  @override
  void onTrayIconRightMouseDown() async {
    _setTrayMenu();
  }

  @override
  void onTrayMenuItemClick(MenuItem menuItem) async {
    if (menuItem.key == kMenuExit) {
      await _quit();
    } else if (menuItem.key == kMenuOpen) {
      if (await windowManager.isMinimized()) {
        await windowManager.restore();
      } else {
        await windowManager.show();
        onWindowRestore();
      }
    }
  }
}
