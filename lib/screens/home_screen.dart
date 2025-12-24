// ignore_for_file: prefer_interpolation_to_compose_strings, use_build_context_synchronously, empty_catches, unused_catch_stack

import 'dart:async';
import 'dart:io';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:protocol_handler/protocol_handler.dart';
import 'package:provider/provider.dart';
import 'package:substore_assistant/app/modules/biz.dart';
import 'package:substore_assistant/app/utils/error_reporter_utils.dart';
import 'package:substore_assistant/app/utils/log.dart';
import 'package:substore_assistant/app/utils/system_scheme_utils.dart';
import 'package:substore_assistant/i18n/strings.g.dart';
import 'package:substore_assistant/screens/dialog_utils.dart';
import 'package:substore_assistant/screens/home_screen_widgets.dart';
import 'package:substore_assistant/screens/scheme_handler.dart';
import 'package:substore_assistant/screens/themes.dart';
import 'package:window_manager/window_manager.dart';

class HomeScreen extends StatefulWidget {
  static RouteSettings routSettings() {
    return const RouteSettings(name: "/");
  }

  final String launchUrl;
  const HomeScreen({super.key, required this.launchUrl});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with WidgetsBindingObserver, ProtocolListener, AfterLayoutMixin {
  bool _onInitAllFinished = false;
  String _initUrl = "";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    protocolHandler.addListener(this);
    _initUrl = widget.launchUrl;
    _init();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    Biz.initHomeFinish();
    ErrorReporterUtils.register(() {
      if (!mounted) {
        return;
      }
      final tcontext = Translations.of(context);
      DialogUtils.showAlertDialog(context, tcontext.meta.deviceNoSpace,
          showCopy: true, showFAQ: true, withVersion: true);
    });

    Future.delayed(const Duration(seconds: 0), () async {
      if (Platform.isMacOS) {
        await hotKeyManager.unregisterAll();
        HotKey hotKey = HotKey(
          key: PhysicalKeyboardKey.keyW,
          modifiers: [HotKeyModifier.meta],
          scope: HotKeyScope.inapp,
        );
        await hotKeyManager.register(
          hotKey,
          keyDownHandler: (hotKey) {
            windowManager.hide();
          },
        );
      }
    });
  }

  Future<bool> futureBool(bool value) async {
    return value;
  }

  void _init() async {
    Biz.onEventInitAllFinish.add(() async {
      await _onInitAllFinish();
    });
  }

  Future<void> _onInitAllFinish() async {
    DialogUtils.faqCallback = (BuildContext context, String text) async {
      /*final tcontext = Translations.of(context);
      var remoteConfig = RemoteConfigManager.getConfig();
      await WebviewHelper.loadUrl(context, remoteConfig.faq, "faqCallback",
          title: tcontext.meta.faq);*/
    };

    if (Platform.isWindows) {
      bool reg = SystemSchemeUtils.isRegistered(SystemSchemeUtils.getScheme());
      if (!reg) {
        SystemSchemeUtils.register(SystemSchemeUtils.getScheme());
      }
    }
    _onInitAllFinished = true;
    if (_initUrl.isNotEmpty) {
      await SchemeHandler.handle(context, _initUrl);
      _initUrl = "";
    }
    setState(() {});
  }

  @override
  void onProtocolUrlReceived(String url) {
    Log.i("onProtocolUrlReceived: $url");
    if (!mounted) {
      return;
    }
    if (!_onInitAllFinished) {
      _initUrl = url;
      return;
    }
    SchemeHandler.handle(context, url);
  }

  @override
  void dispose() {
    protocolHandler.removeListener(this);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var themes = Provider.of<Themes>(context, listen: false);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarIconBrightness:
                themes.getStatusBarIconBrightness(context),
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            statusBarBrightness: themes.getStatusBarBrightness(context),
            statusBarIconBrightness: themes.getStatusBarIconBrightness(context),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HomeScreenWidgetPart1(),
                      SizedBox(
                        height: 15,
                      ),
                      HomeScreenWidgetPart2(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
