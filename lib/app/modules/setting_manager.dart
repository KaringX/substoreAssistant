// ignore_for_file: empty_catches

import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:substore_assistant/app/utils/log.dart';
import 'package:substore_assistant/app/utils/path_utils.dart';
import 'package:substore_assistant/i18n/strings.g.dart';
import 'package:substore_assistant/screens/theme_define.dart';

class SettingConfigItemUI {
  String theme = ThemeDefine.kThemeLight;

  Map<String, dynamic> toJson() => {
        'theme': theme,
      };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    theme = map["theme"] ?? "";

    switch (theme) {
      case "dark":
        theme = ThemeDefine.kThemeDark;
        break;

      case "light":
        theme = ThemeDefine.kThemeLight;
        break;

      case "system":
        theme = ThemeDefine.kThemeSystem;
        break;

      default:
        theme = ThemeDefine.kThemeLight;
        break;
    }
  }

  static SettingConfigItemUI fromJsonStatic(Map<String, dynamic>? map) {
    SettingConfigItemUI config = SettingConfigItemUI();
    config.fromJson(map);
    return config;
  }
}

class SettingConfig {
  static int kFrontendPort = 6066;
  static int kBackendPort = 6067;
  String languageTag = "";
  SettingConfigItemUI ui = SettingConfigItemUI();
  int frontendPort = kFrontendPort;
  int backendPort = kBackendPort;

  Map<String, dynamic> toJson() => {
        'language_tag': languageTag,
        'ui': ui,
        'front_end_port': frontendPort,
        'back_end_port': backendPort,
      };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

    languageTag = map["language_tag"] ?? "";
    ui = SettingConfigItemUI.fromJsonStatic(map["ui"]);
    frontendPort = map["front_end_port"] ?? frontendPort;
    backendPort = map["back_end_port"] ?? backendPort;
  }

  static SettingConfig fromJsonStatic(Map<String, dynamic>? map) {
    SettingConfig config = SettingConfig();
    config.fromJson(map);
    return config;
  }

  void clear() {}

  static String languageTagForCountry() {
    return LocaleSettings.currentLocale.languageTag.replaceAll("-", "_");
  }
}

class SettingManager {
  static bool _saving = false;
  static SettingConfig _config = SettingConfig();
  static Future<void> init({bool fromBackupRestore = false}) async {
    await load();
    bool needSave = await parseConfig();
    if (needSave) {
      save();
    }
  }

  static Future<void> uninit() async {}
  static Future<void> reload() async {
    await load();
  }

  static Future<bool> parseConfig() async {
    bool save = false;

    String languageTag = "en";
    if (_config.languageTag.isNotEmpty) {
      for (var locale in AppLocale.values) {
        if (locale.languageTag == _config.languageTag) {
          languageTag = locale.languageTag;
          break;
        }
      }
    } else {
      String planguageTag = [
        PlatformDispatcher.instance.locale.languageCode,
        PlatformDispatcher.instance.locale.countryCode ?? ""
      ].join("-");
      for (var locale in AppLocale.values) {
        if (locale.languageTag == planguageTag) {
          languageTag = locale.languageTag;
          break;
        }
      }
    }

    if (languageTag.isEmpty) {
      languageTag = "en";
    }

    for (var locale in AppLocale.values) {
      if (languageTag == locale.languageTag) {
        save = true;
        _config.languageTag = languageTag;
        var current = LocaleSettings.currentLocale;
        if (current != locale) {
          await LocaleSettings.setLocale(locale);
        }

        break;
      }
    }

    return save;
  }

  static Future<void> load() async {
    String filePath = await PathUtils.settingFilePath();
    var file = File(filePath);
    bool exists = await file.exists();
    if (!exists) {
      return;
    }
    String content = "";
    try {
      content = await file.readAsString();
      if (content.isNotEmpty) {
        var config = jsonDecode(content);
        _config.fromJson(config);
      }
    } catch (err, stacktrace) {
      Log.w("SettingManager.load exception $filePath ${err.toString()}");
    }
  }

  static void save() async {
    if (_saving) {
      return;
    }
    _saving = true;
    String filePath = await PathUtils.settingFilePath();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String content = encoder.convert(_config.toJson());
    try {
      await File(filePath).writeAsString(content, flush: true);
    } catch (err, stacktrace) {
      Log.w("SettingManager.save exception  $filePath ${err.toString()}");
    }
    _saving = false;
  }

  static void reset() async {
    final languageTag = _config.languageTag;
    _config = SettingConfig();
    _config.languageTag = languageTag;
  }

  static SettingConfig getConfig() {
    return _config;
  }
}
