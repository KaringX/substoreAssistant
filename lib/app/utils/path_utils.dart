// ignore_for_file: unused_catch_stack, empty_catches

import "dart:io";

import "package:substore_assistant/app/utils/file_utils.dart";
import "package:path/path.dart" as path;
import 'package:path_provider/path_provider.dart';

class PathUtils {
  static String _appAssetsDir = "";
  static String _profileDir = "";

  static String appAssetsDir() {
    if (_appAssetsDir.isNotEmpty) {
      return _appAssetsDir;
    }

    if (Platform.isMacOS) {
      _appAssetsDir = frameworkDir();
      _appAssetsDir = path.join(_appAssetsDir, "App.framework", "Resources");
    } else if (Platform.isLinux) {
      _appAssetsDir = frameworkDir();
      _appAssetsDir = path.join(_appAssetsDir, "data");
    } else if (Platform.isWindows) {
      _appAssetsDir = frameworkDir();
      _appAssetsDir = path.join(_appAssetsDir, "data");
    }
    return _appAssetsDir;
  }

  static String flutterAssetsDir() {
    return path.join(appAssetsDir(), "flutter_assets");
  }

  static String assetsDir() {
    return path.join(flutterAssetsDir(), "assets");
  }

  static String assetsDatasDir() {
    return path.join(assetsDir(), "datas");
  }

  static Future<String> profileDirNonPortable() async {
    Directory? sharedDirectory;
    if (Platform.isWindows || Platform.isLinux) {
      sharedDirectory = await getApplicationSupportDirectory();
    } else {
      //todo
      //sharedDirectory =
      //    await FlutterVpnService.getAppGroupDirectory(AppUtils.getGroupId());
    }

    if (sharedDirectory != null) {
      if (!await sharedDirectory.exists()) {
        await sharedDirectory.create(recursive: true);
      }

      return sharedDirectory.path;
    }
    return "";
  }

  static Future<String> profileDir() async {
    if (_profileDir.isNotEmpty) {
      return _profileDir;
    }

    _profileDir = await profileDirNonPortable();
    return _profileDir;
  }

  static Future<String> cacheDir() async {
    String dir = await profileDir();
    String cdir = path.join(dir, "cache");
    await FileUtils.createDir(cdir);
    return cdir;
  }

  static Future<String> sriptDataDir() async {
    String dir = await profileDir();
    String cdir = path.join(dir, "scripts");
    await FileUtils.createDir(cdir);
    return cdir;
  }

  static String exeDir() {
    String dir = path.dirname(Platform.resolvedExecutable);
    return dir;
  }

  static String frameworkDir() {
    String filepath = PathUtils.exeDir();
    if (Platform.isMacOS) {
      filepath = path.dirname(filepath);
      filepath = path.join(filepath, "Frameworks");
    } else if (Platform.isWindows) {
    } else if (Platform.isLinux) {
    } else {
      throw "unsupport platform";
    }
    return filepath;
  }

  static String macosDir() {
    if (Platform.isMacOS) {
      String filepath = PathUtils.exeDir();
      filepath = path.dirname(filepath);
      filepath = path.join(filepath, "MacOS");
      return filepath;
    }
    return "";
  }

  static String getExeName() {
    if (Platform.isWindows) {
      return "substoreAssistant.exe";
    }
    if (Platform.isMacOS) {
      return "substoreAssistant";
    }
    if (Platform.isLinux) {
      return "substoreAssistant";
    }
    return "";
  }

  static String serviceExeName() {
    if (Platform.isLinux) {
      return "substoreAssistantService";
    } else if (Platform.isWindows) {
      return "substoreAssistantService.exe";
    } else if (Platform.isMacOS) {
      return "substoreAssistantService";
    }
    return "";
  }

  static String serviceExePath() {
    String filePath = exeDir();
    return path.join(filePath, serviceExeName());
  }

  static String serviceScriptName() {
    return "scripts.zip";
  }

  static String serviceScriptPath() {
    String filePath = assetsDatasDir();
    return path.join(filePath, "scripts", serviceScriptName());
  }

  static String logFileName() {
    return "app.log";
  }

  static Future<String> logFilePath() async {
    String filePath = await profileDir();
    return path.join(filePath, logFileName());
  }

  static String serviceLogFileName() {
    return "service.log";
  }

  static Future<String> serviceLogFilePath() async {
    String filePath = await PathUtils.profileDir();
    return path.join(filePath, serviceLogFileName());
  }

  static String serviceConfigFileName() {
    return "service.json";
  }

  static Future<String> serviceConfigFilePath() async {
    String filePath = await PathUtils.profileDir();
    return path.join(filePath, serviceConfigFileName());
  }

  static String settingFileName() {
    return "setting.json";
  }

  static Future<String> settingFilePath() async {
    String filePath = await profileDir();
    return path.join(filePath, settingFileName());
  }

  static String autoUpdateFileName() {
    return "auto_update.json";
  }

  static Future<String> autoUpdateFilePath() async {
    String filePath = await profileDir();
    return path.join(filePath, autoUpdateFileName());
  }
}
