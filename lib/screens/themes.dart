import 'package:flutter/material.dart';
import 'package:substore_assistant/screens/theme_data_dark.dart';
import 'package:substore_assistant/screens/theme_data_light.dart';
import 'package:substore_assistant/screens/theme_define.dart';

class Themes with ChangeNotifier {
  String _theme = '';
  void setTheme(String theme, bool notify) {
    switch (theme) {
      case ThemeDefine.kThemeSystem:
      case ThemeDefine.kThemeLight:
      case ThemeDefine.kThemeDark:
        _theme = theme;
      default:
        return;
    }
    if (!notify) {
      return;
    }

    notifyListeners();
  }

  String theme() {
    return _theme;
  }

  ThemeData getTheme(BuildContext context) {
    var brightness = MediaQuery.platformBrightnessOf(context);
    switch (_theme) {
      case ThemeDefine.kThemeLight:
        return ThemeDataLight.theme(context);
      case ThemeDefine.kThemeDark:
        return ThemeDataDark.theme(context);
    }
    //ThemeDefine.kThemeSystem:
    return brightness == Brightness.dark
        ? ThemeDataDark.theme(context)
        : ThemeDataLight.theme(context);
  }

  Color? getThemeIconColor(BuildContext context) {
    var brightness = MediaQuery.platformBrightnessOf(context);
    switch (_theme) {
      case ThemeDefine.kThemeSystem:
        return brightness == Brightness.dark
            ? Colors.white.withValues(alpha: 0.5)
            : Colors.black.withValues(alpha: 0.5);
      case ThemeDefine.kThemeLight:
        return Colors.black.withValues(alpha: 0.5);
      case ThemeDefine.kThemeDark:
        return Colors.white.withValues(alpha: 0.5);
    }
    return Colors.grey.withValues(alpha: 0.5);
  }

  ThemeMode themeMode() {
    switch (_theme) {
      case ThemeDefine.kThemeSystem:
        return ThemeMode.system;
      case ThemeDefine.kThemeLight:
        return ThemeMode.light;
      case ThemeDefine.kThemeDark:
        return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  ThemeData themeData(BuildContext context) {
    var brightness = MediaQuery.platformBrightnessOf(context);
    switch (_theme) {
      case ThemeDefine.kThemeSystem:
        return brightness == Brightness.dark
            ? ThemeDataDark.theme(context)
            : ThemeDataLight.theme(context);
      case ThemeDefine.kThemeLight:
        return ThemeDataLight.theme(context);
      case ThemeDefine.kThemeDark:
        return ThemeDataDark.theme(context);
    }
    return ThemeDataLight.theme(context);
  }

  Brightness? getStatusBarBrightness(BuildContext context) {
    return null;
  }

  Brightness? getStatusBarIconBrightness(BuildContext context) {
    return null;
  }
}
