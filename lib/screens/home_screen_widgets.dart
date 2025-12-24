import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

import 'package:substore_assistant/app/modules/biz.dart';
import 'package:substore_assistant/app/modules/setting_manager.dart';

import 'package:substore_assistant/app/utils/app_lifecycle_state_notify.dart';
import 'package:substore_assistant/app/utils/file_utils.dart';
import 'package:substore_assistant/app/utils/log.dart';
import 'package:substore_assistant/app/utils/move_to_background_utils.dart';
import 'package:substore_assistant/app/utils/path_utils.dart';
import 'package:substore_assistant/app/utils/url_launcher_utils.dart';
import 'package:substore_assistant/app/utils/zip_utils.dart';

import 'package:substore_assistant/i18n/strings.g.dart';
import 'package:substore_assistant/screens/about_screen.dart';
import 'package:substore_assistant/screens/dialog_utils.dart';

import 'package:substore_assistant/screens/group_helper.dart';
import 'package:substore_assistant/screens/scheme_handler.dart';

import 'package:substore_assistant/screens/theme_define.dart';

class HomeScreenWidgetPart1 extends StatefulWidget {
  const HomeScreenWidgetPart1({super.key});

  @override
  State<HomeScreenWidgetPart1> createState() => _HomeScreenWidgetPart1();
}

class _HomeScreenWidgetPart1 extends State<HomeScreenWidgetPart1> {
  Process? _process;
  bool _starting = false;
  @override
  void initState() {
    super.initState();

    AppLifecycleStateNofity.onStateResumed(hashCode, _onStateResumed);
    AppLifecycleStateNofity.onStatePaused(hashCode, _onStatePaused);

    if (!AppLifecycleStateNofity.isPaused()) {
      _onStateResumed();
    }
    Biz.onEventInitAllFinish.add(() async {
      await _onInitAllFinish();
    });
    Biz.onEventExit = (() async {
      await stop();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tcontext = Translations.of(context);
    bool connected = _process != null;

    var widgets = [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: connected ? Colors.green : Colors.grey,
                      shape: BoxShape.circle,
                    )),
                SizedBox(
                  width: 10,
                ),
                Text(
                  connected
                      ? tcontext.meta.connected
                      : tcontext.meta.disconnected,
                  textAlign: TextAlign.left,
                ),
              ]),
              Stack(children: [
                SizedBox(
                  width: 60,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Switch.adaptive(
                      value: connected,
                      onChanged: (bool value) async {
                        if (value) {
                          await start("switch");
                        } else {
                          await stop();
                        }
                      },
                    ),
                  ),
                ),
                Positioned(
                    left: 8,
                    top: 12,
                    child: SizedBox(
                        width: 25,
                        height: 25,
                        child: _starting
                            ? const RepaintBoundary(
                                child: CircularProgressIndicator(
                                    color: ThemeDefine.kColorGreenBright))
                            : null)),
              ]),
            ],
          ),
          SizedBox(
            height: connected ? 10 : 0,
          ),
          if (_process != null && !_starting) ...[
            ListTile(
              title: Text("SubStore"),
              leading: Icon(
                Icons.help,
                size: 20,
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                size: 20,
              ),
              minVerticalPadding: 22,
              onTap: () async {
                final settings = SettingManager.getConfig();
                final api = "http://127.0.0.1:${settings.backendPort}";

                UrlLauncherUtils.loadUrl(
                    "http://127.0.0.1:${settings.frontendPort}?api=${Uri.encodeComponent(api)}");
              },
            ),
          ]
        ],
      ),
    ];

    return Card(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return widgets[index];
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
            thickness: 0.3,
          );
        },
        itemCount: widgets.length,
      ),
    ));
  }

  Future<void> _onInitAllFinish() async {
    SchemeHandler.onStart = _onStart;
    SchemeHandler.onStop = _onStop;

    /*if (SettingManager.getConfig().autoConnectAfterLaunch) {
      await start("launch");
    }*/
  }

  Future<void> stop() async {
    _process?.kill();
    _process = null;
    setState(() {});
  }

  Future<int?> getServiceProcessPid() async {
    // 在 Linux/macOS 上，可以执行 'ps -ef' 或 'ps aux'
    // 在 Windows 上，可能需要 'tasklist'
    ProcessResult result;
    if (Platform.isWindows) {
      result = await Process.run('tasklist', ['/svc']); // /v 显示详细信息
    } else {
      // Linux/macOS
      result =
          await Process.run('ps', ['-ef | grep ${PathUtils.serviceExeName()}']);
    }

    if (result.exitCode != 0) {
      return null;
    }
    String content = result.stdout;
    List<String> lines = content.split('\n');
    for (int i = 0; i < lines.length; ++i) {
      lines[i] = lines[i].trim();
    }
    if (Platform.isWindows) {
      for (int i = 0; i < lines.length; ++i) {
        if (lines[i].startsWith(
            path.basenameWithoutExtension(PathUtils.serviceExeName()))) {
          final parts = lines[i].split(" ");
          for (int j = 1; j < parts.length; ++j) {
            if (parts[j] == " ") {
              continue;
            }
            int? pid = int.tryParse(parts[j]);
            if (pid != null) {
              return pid;
            }
          }

          break;
        }
      }
    } else {
      for (int i = 0; i < lines.length; ++i) {
        final parts = lines[i].split(" ");
        for (int j = 1; j < parts.length; ++j) {
          if (parts[j] == " ") {
            continue;
          }
          int? pid = int.tryParse(parts[j]);
          if (pid != null) {
            return pid;
          }
        }
      }
    }
    return null;
  }

  Future<bool> start(String from) async {
    _starting = true;
    setState(() {});
    final pid = await getServiceProcessPid();
    if (pid != null) {
      Process.killPid(pid);
    }

    const inProduction = bool.fromEnvironment("dart.vm.product");
    final servicePath = PathUtils.serviceExePath();
    final serviceScriptPath = PathUtils.serviceScriptPath();
    final scriptDir = await PathUtils.sriptDataDir();
    final scriptPath = path.join(scriptDir, "main.ts");
    final dataDirPath = PathUtils.assetsDatasDir();
    final workDirPath = await PathUtils.profileDir();
    final setting = SettingManager.getConfig();
    await FileUtils.createDir(path.join(workDirPath, "substore"));
    await FileUtils.createDir(path.join(workDirPath, "substore-logs"));
    final err = await ZipUtils.unzip(serviceScriptPath, scriptDir);
    if (err != null) {
      if (mounted) {
        DialogUtils.showAlertDialog(context, err.message);
      }
      _starting = false;
      setState(() {});
      return false;
    }

    List<String> arguments = [];
    arguments.add(scriptPath);
    arguments.add("--data_dir=$dataDirPath");
    arguments.add("--work_dir=$workDirPath");
    arguments.add("--frontend_port=${setting.frontendPort}");
    arguments.add("--backend_port=${setting.backendPort}");

    String workdir = path.dirname(servicePath);
    String errMessage = "";
    String outMessage = "";

    try {
      _process = await Process.start(
        servicePath,
        arguments,
        workingDirectory: workdir,
        mode: ProcessStartMode.normal,
      );

      _process?.stdout.transform(utf8.decoder).forEach((element) {
        if (!inProduction) {
          print("node stdout:\n$element");
        }
        outMessage += element;
      });

      _process?.stderr.transform(utf8.decoder).forEach((element) async {
        if (!inProduction) {
          print("node stderr:\n$element");
        }
        Log.w("node stderr:\n$element");

        errMessage += element;
      });
      _process?.exitCode.then((value) {
        _starting = false;
        _process = null;
        setState(() {});
      });
    } catch (err) {
      errMessage = err.toString();
    }
    while (outMessage.isEmpty && errMessage.isEmpty && _process != null) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    _starting = false;
    setState(() {});
    if (errMessage.isNotEmpty) {
      if (mounted) {
        DialogUtils.showAlertDialog(context, errMessage);
        return false;
      }
    }
    if (outMessage.isNotEmpty && outMessage.contains("Error")) {
      if (mounted) {
        DialogUtils.showAlertDialog(context, outMessage);
        return false;
      }
    }
    return true;
  }

  Future<void> _onStart(bool opensubstore, bool background) async {
    Future.delayed(const Duration(seconds: 0), () async {
      bool ok = await start("scheme");
      if (ok) {
        if (background) {
          MoveToBackgroundUtils.moveToBackground(
              duration: const Duration(milliseconds: 300));
        }
      }
    });
  }

  Future<void> _onStop(bool background) async {
    Future.delayed(const Duration(seconds: 0), () async {
      await stop();

      if (background) {
        MoveToBackgroundUtils.moveToBackground(
            duration: const Duration(milliseconds: 300));
      }
    });
  }

  Future<void> _onStateResumed() async {}

  Future<void> _onStatePaused() async {}
}

class HomeScreenWidgetPart2 extends StatelessWidget {
  const HomeScreenWidgetPart2({super.key});

  @override
  Widget build(BuildContext context) {
    //AutoUpdateCheckVersion versionCheck = AutoUpdateManager.getVersionCheck();
    final tcontext = Translations.of(context);
    var widgets = [
      ListTile(
        title: Text(tcontext.meta.setting),
        leading: Icon(
          Icons.settings,
          size: 20,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          size: 20,
        ),
        minVerticalPadding: 22,
        onTap: () async {
          await GroupHelper.showAppSettings(context);
        },
      ),
    ];
    /*if (versionCheck.newVersion) {
      widgets.add(
        ListTile(
          title: Text(tcontext.meta.hasNewVersion(p: versionCheck.version)),
          leading: Icon(
            Icons.fiber_new_outlined,
            size: 20,
            color: Colors.red,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 20,
          ),
          minVerticalPadding: 22,
          onTap: () async {
            GroupHelper.newVersionUpdate(context);
          },
        ),
      );
    }*/

    widgets.addAll([
      ListTile(
        title: Text(tcontext.meta.help),
        leading: Icon(
          Icons.help,
          size: 20,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          size: 20,
        ),
        minVerticalPadding: 22,
        onTap: () async {
          await GroupHelper.showHelp(context);
        },
      ),
      ListTile(
        title: Text(tcontext.meta.about),
        leading: Icon(
          Icons.info,
          size: 20,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          size: 20,
        ),
        minVerticalPadding: 22,
        onTap: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  settings: AboutScreen.routSettings(),
                  builder: (context) => AboutScreen()));
        },
      )
    ]);

    return Card(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return widgets[index];
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
            thickness: 0.3,
          );
        },
        itemCount: widgets.length,
      ),
    ));
  }
}
