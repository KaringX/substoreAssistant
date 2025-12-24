//import 'package:device_info_plus/device_info_plus.dart';

import 'package:substore_assistant/app/utils/app_lifecycle_state_notify.dart';
import 'package:substore_assistant/app/utils/log.dart';

class Biz {
  static final List<void Function()> onEventInitFinish = [];
  static final List<void Function()> onEventInitHomeFinish = [];
  static final List<void Function()> onEventInitAllFinish = [];
  static bool _initFinish = false;
  static bool _initHomeFinish = false;
  static void Function()? onEventExit;
  static void Function()? onRequestExit;

  static Future<void> init() async {
    for (var callback in onEventInitFinish) {
      callback();
    }
    _initFinish = true;
    Log.d("initFinish");
    initAllFinish();

    AppLifecycleStateNofity.init();
  }

  static Future<void> uninit() async {
    if (onEventExit != null) {
      onEventExit!();
    }
    AppLifecycleStateNofity.uninit();
  }

  static void clearCache() {}

  static void initHomeFinish() {
    for (var callback in onEventInitHomeFinish) {
      callback();
    }
    _initHomeFinish = true;
    Log.d("initHomeFinish");
    initAllFinish();
  }

  static void initAllFinish() {
    if (_initFinish && _initHomeFinish) {
      Log.d("initAllFinish");
      for (var callback in onEventInitAllFinish) {
        callback();
      }
    }
  }

  static void quit() {
    Future.delayed(const Duration(milliseconds: 10), () {
      if (onRequestExit != null) {
        onRequestExit!();
      }
    });
  }
}
