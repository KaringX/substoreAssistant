import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

abstract final class AppUtils {
  static Future<String> getPackgetVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return "${packageInfo.version}.${packageInfo.buildNumber}";
    } catch (e) {
      return getBuildinVersion();
    }
  }

  static String getName() {
    return "substore Assistant";
  }

  static String getReleaseVersion() {
    List<String> v = getBuildinVersion().split(".");
    return "${v[0]}.${v[1]}.${v[2]}+${v[3]}";
  }

  static String getBuildinVersion() {
    return "1.0.0.1";
  }

  static String getId() {
    return "com.nebula.substoreassistant";
  }

  static String getGroupId() {
    return "group.com.nebula.substoreassistant";
  }

  static String getBundleId(bool systemExtension) {
    if (Platform.isMacOS) {
      return "com.nebula.substoreassistant.substoreAssistantService";
    }
    return "";
  }

  static String getICloudContainerId() {
    return "iCloud.com.nebula.substoreassistant";
  }
}
