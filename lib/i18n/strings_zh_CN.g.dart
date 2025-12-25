///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsZhCn with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhCn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsZhCn _root = this; // ignore: unused_field

	@override 
	TranslationsZhCn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhCn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsLaunchFailedScreenZhCn LaunchFailedScreen = _TranslationsLaunchFailedScreenZhCn._(_root);
	@override late final _TranslationsMainZhCn main = _TranslationsMainZhCn._(_root);
	@override late final _TranslationsMetaZhCn meta = _TranslationsMetaZhCn._(_root);
	@override Map<String, String> get locales => {
		'en': 'English',
		'zh-CN': '简体中文',
		'ar': 'عربي',
		'ru': 'Русский',
		'fa': 'فارسی',
	};
}

// Path: LaunchFailedScreen
class _TranslationsLaunchFailedScreenZhCn implements TranslationsLaunchFailedScreenEn {
	_TranslationsLaunchFailedScreenZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => '应用启动失败[无效的进程名称],请重新安装应用到独立目录';
	@override String get invalidProfile => '应用启动失败[访问配置文件失败],请重新安装应用';
	@override String get invalidVersion => '应用启动失败[无效版本],请重新安装应用';
	@override String get systemVersionLow => '应用启动失败[系统版本过低]';
	@override String get invalidInstallPath => '无效的安装路径,请重新安装到有效路径';
}

// Path: main
class _TranslationsMainZhCn implements TranslationsMainEn {
	_TranslationsMainZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMainTrayZhCn tray = _TranslationsMainTrayZhCn._(_root);
}

// Path: meta
class _TranslationsMetaZhCn implements TranslationsMetaEn {
	_TranslationsMetaZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get enable => '启用';
	@override String get disable => '禁用';
	@override String get open => '打开';
	@override String get close => '关闭';
	@override String get quit => '退出';
	@override String get more => '更多';
	@override String get tips => '提示';
	@override String get copy => '拷贝';
	@override String get save => '保存';
	@override String get ok => '确定';
	@override String get cancel => '取消';
	@override String get faq => '常见问题';
	@override String get download => '下载';
	@override String get loading => '加载中...';
	@override String get days => '天';
	@override String get hours => '时';
	@override String get minutes => '分';
	@override String get seconds => '秒';
	@override String get connect => '连接';
	@override String get disconnect => '断开';
	@override String get connected => '已连接';
	@override String get disconnected => '未连接';
	@override String get connecting => '连接中';
	@override String get connectTimeout => '连接超时';
	@override String get timeout => '超时';
	@override String get timeoutDuration => '超时时长';
	@override String get language => '语言';
	@override String get next => '下一步';
	@override String get done => '完成';
	@override String get none => '无';
	@override String get reset => '重置';
	@override String get required => '必填';
	@override String get other => '其他';
	@override String get launchAtStartup => '开机启动';
	@override String get autoConnectAfterLaunch => '启动后自动连接';
	@override String get hideAfterLaunch => '启动后隐藏窗口';
	@override String get termOfUse => '使用条款';
	@override String get privacyPolicy => '隐私政策';
	@override String get log => '日志';
	@override String get coreLog => '核心日志';
	@override String get core => '核心';
	@override String get help => '帮助';
	@override String get tutorial => '使用教程';
	@override String get theme => '主题';
	@override String get autoUpdate => '自动更新';
	@override String get updateChannel => '自动更新通道';
	@override String hasNewVersion({required Object p}) => '更新版本 ${p}';
	@override String get devOptions => '开发者选项';
	@override String get about => '关于';
	@override String get name => '名称';
	@override String get version => '版本';
	@override String get share => '分享';
	@override String get server => '服务器';
	@override String get port => '端口';
	@override String get frontendPort => '前端端口';
	@override String get backendPort => '后台端口';
	@override String get donate => '捐助';
	@override String get setting => '设置';
	@override String get deviceNoSpace => '磁盘空间不足';
	@override String get openDir => '打开文件目录';
}

// Path: main.tray
class _TranslationsMainTrayZhCn implements TranslationsMainTrayEn {
	_TranslationsMainTrayZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => '    打开    ';
	@override String get menuExit => '    退出    ';
}

/// The flat map containing all translations for locale <zh-CN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhCn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'LaunchFailedScreen.invalidProcess' => '应用启动失败[无效的进程名称],请重新安装应用到独立目录',
			'LaunchFailedScreen.invalidProfile' => '应用启动失败[访问配置文件失败],请重新安装应用',
			'LaunchFailedScreen.invalidVersion' => '应用启动失败[无效版本],请重新安装应用',
			'LaunchFailedScreen.systemVersionLow' => '应用启动失败[系统版本过低]',
			'LaunchFailedScreen.invalidInstallPath' => '无效的安装路径,请重新安装到有效路径',
			'main.tray.menuOpen' => '    打开    ',
			'main.tray.menuExit' => '    退出    ',
			'meta.enable' => '启用',
			'meta.disable' => '禁用',
			'meta.open' => '打开',
			'meta.close' => '关闭',
			'meta.quit' => '退出',
			'meta.more' => '更多',
			'meta.tips' => '提示',
			'meta.copy' => '拷贝',
			'meta.save' => '保存',
			'meta.ok' => '确定',
			'meta.cancel' => '取消',
			'meta.faq' => '常见问题',
			'meta.download' => '下载',
			'meta.loading' => '加载中...',
			'meta.days' => '天',
			'meta.hours' => '时',
			'meta.minutes' => '分',
			'meta.seconds' => '秒',
			'meta.connect' => '连接',
			'meta.disconnect' => '断开',
			'meta.connected' => '已连接',
			'meta.disconnected' => '未连接',
			'meta.connecting' => '连接中',
			'meta.connectTimeout' => '连接超时',
			'meta.timeout' => '超时',
			'meta.timeoutDuration' => '超时时长',
			'meta.language' => '语言',
			'meta.next' => '下一步',
			'meta.done' => '完成',
			'meta.none' => '无',
			'meta.reset' => '重置',
			'meta.required' => '必填',
			'meta.other' => '其他',
			'meta.launchAtStartup' => '开机启动',
			'meta.autoConnectAfterLaunch' => '启动后自动连接',
			'meta.hideAfterLaunch' => '启动后隐藏窗口',
			'meta.termOfUse' => '使用条款',
			'meta.privacyPolicy' => '隐私政策',
			'meta.log' => '日志',
			'meta.coreLog' => '核心日志',
			'meta.core' => '核心',
			'meta.help' => '帮助',
			'meta.tutorial' => '使用教程',
			'meta.theme' => '主题',
			'meta.autoUpdate' => '自动更新',
			'meta.updateChannel' => '自动更新通道',
			'meta.hasNewVersion' => ({required Object p}) => '更新版本 ${p}',
			'meta.devOptions' => '开发者选项',
			'meta.about' => '关于',
			'meta.name' => '名称',
			'meta.version' => '版本',
			'meta.share' => '分享',
			'meta.server' => '服务器',
			'meta.port' => '端口',
			'meta.frontendPort' => '前端端口',
			'meta.backendPort' => '后台端口',
			'meta.donate' => '捐助',
			'meta.setting' => '设置',
			'meta.deviceNoSpace' => '磁盘空间不足',
			'meta.openDir' => '打开文件目录',
			'locales.en' => 'English',
			'locales.zh-CN' => '简体中文',
			'locales.ar' => 'عربي',
			'locales.ru' => 'Русский',
			'locales.fa' => 'فارسی',
			_ => null,
		};
	}
}
