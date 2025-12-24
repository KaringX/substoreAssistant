import 'dart:io';

import 'package:protocol_handler/protocol_handler.dart';
import 'package:win32_registry/win32_registry.dart';

class SystemSchemeUtils {
  static const String _kScheme = "substoreAssistant";
  static String getScheme() => _kScheme;
  static String getSchemeWith() => "$_kScheme://";
  static bool isRegistered(String scheme) {
    return _isRegistered(scheme);
  }

  static Future<String?> register(String scheme) async {
    try {
      await protocolHandler.register(scheme);
    } catch (err) {
      return err.toString();
    }
    return null;
  }

  static String? unregister(String scheme) {
    if (!Platform.isWindows) {
      return null;
    }

    String path = 'Software\\Classes\\$scheme\\shell\\open\\command';
    try {
      Registry.currentUser.deleteKey(path);
    } catch (err) {
      return err.toString();
    }

    return null;
  }

  static bool _isRegistered(String scheme) {
    if (!Platform.isWindows) {
      return false;
    }
    String appPath = Platform.resolvedExecutable.toLowerCase();

    String path = 'Software\\Classes\\$scheme\\shell\\open\\command';

    RegistryValue? value = Registry.currentUser.getValue("", path: path);
    if (value == null || value.type != RegistryValueType.string) {
      return false;
    }
    String file = value.data as String;
    return file.toLowerCase().indexOf(appPath) == 0;
  }
}
