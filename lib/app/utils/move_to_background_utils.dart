import 'package:window_manager/window_manager.dart';

abstract final class MoveToBackgroundUtils {
  static Future<void> moveToBackground({Duration? duration}) async {
    if (duration != null) {
      Future.delayed(const Duration(milliseconds: 300), () async {
        await windowManager.hide();
      });
    } else {
      await windowManager.hide();
    }
  }
}
