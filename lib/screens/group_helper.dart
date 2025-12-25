// ignore_for_file: unused_catch_stack, empty_catches

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:substore_assistant/app/modules/setting_manager.dart';
import 'package:substore_assistant/i18n/strings.g.dart';
import 'package:substore_assistant/screens/group_item_creator.dart';
import 'package:substore_assistant/screens/group_item_options.dart';
import 'package:substore_assistant/screens/group_screen.dart';
import 'package:substore_assistant/screens/language_settings_screen.dart';
import 'package:substore_assistant/screens/theme_define.dart';
import 'package:substore_assistant/screens/themes.dart';

class GroupHelper {
  static Future<void> newVersionUpdate(BuildContext context) async {
    //todo
    /*AutoUpdateCheckVersion versionCheck = AutoUpdateManager.getVersionCheck();
    if (!versionCheck.newVersion) {
      return;
    }

    String url = versionCheck.url;

    await UrlLauncherUtils.loadUrl(url);*/
  }

  static Future<void> showHelp(BuildContext context) async {
    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      final tcontext = Translations.of(context);

      List<GroupItemOptions> options = [
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.download,
                onPush: () async {
                  //todo
                  //var remoteConfig = RemoteConfigManager.getConfig();
                  //await UrlLauncherUtils.loadUrl(remoteConfig.download);
                })),
      ];

      return [
        GroupItem(options: options),
      ];
    }

    final tcontext = Translations.of(context);
    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("help"),
            builder: (context) => GroupScreen(
                  title: tcontext.meta.help,
                  getOptions: getOptions,
                )));
    SettingManager.save();
  }

  static Future<void> showAppSettings(BuildContext context) async {
    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      final tcontext = Translations.of(context);
      var setting = SettingManager.getConfig();

      List<GroupItemOptions> options = [
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.language,
                icon: Icons.language_outlined,
                text: tcontext.locales[setting.languageTag],
                textWidthPercent: 0.5,
                onPush: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          settings: LanguageSettingsScreen.routSettings(),
                          builder: (context) => const LanguageSettingsScreen(
                              canPop: true, canGoBack: true)));
                })),
        GroupItemOptions(
            stringPickerOptions: GroupItemStringPickerOptions(
                name: tcontext.meta.theme,
                selected: setting.ui.theme,
                strings: [
                  ThemeDefine.kThemeLight,
                  ThemeDefine.kThemeDark,
                  ThemeDefine.kThemeSystem
                ],
                textWidthPercent: 0.3,
                onPicker: (String? selected) async {
                  if (selected == null) {
                    return;
                  }
                  setting.ui.theme = selected;
                  Provider.of<Themes>(context, listen: false)
                      .setTheme(selected, true);
                })),
      ];
      List<GroupItemOptions> options1 = [
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: "SubStore ${tcontext.meta.frontendPort}",
                text: setting.frontendPort.toString(),
                textWidthPercent: 0.3,
                hint: tcontext.meta.required,
                onChanged: (String value) {
                  setting.frontendPort =
                      int.tryParse(value) ?? SettingConfig.kFrontendPort;
                })),
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: "SubStore ${tcontext.meta.backendPort}",
                text: setting.backendPort.toString(),
                textWidthPercent: 0.3,
                hint: tcontext.meta.required,
                onChanged: (String value) {
                  setting.backendPort =
                      int.tryParse(value) ?? SettingConfig.kBackendPort;
                })),
      ];
      List<GroupItem> gitems = [
        GroupItem(options: options),
        GroupItem(options: options1),
      ];

      return gitems;
    }

    final tcontext = Translations.of(context);
    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("appSettings"),
            builder: (context) => GroupScreen(
                  title: tcontext.meta.setting,
                  getOptions: getOptions,
                )));
    SettingManager.save();
  }
}
