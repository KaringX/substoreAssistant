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
class TranslationsAr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsLaunchFailedScreenAr LaunchFailedScreen = _TranslationsLaunchFailedScreenAr._(_root);
	@override late final _TranslationsMainAr main = _TranslationsMainAr._(_root);
	@override late final _TranslationsMetaAr meta = _TranslationsMetaAr._(_root);
	@override Map<String, String> get locales => {
		'en': 'English',
		'zh-CN': '简体中文',
		'ar': 'عربي',
		'ru': 'Русский',
		'fa': 'فارسی',
	};
}

// Path: LaunchFailedScreen
class _TranslationsLaunchFailedScreenAr implements TranslationsLaunchFailedScreenEn {
	_TranslationsLaunchFailedScreenAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => 'فشل التطبيق في البدء [اسم عملية غير صالح] ، يرجى إعادة تثبيت التطبيق إلى دليل منفصل';
	@override String get invalidProfile => 'فشل التطبيق في البدء [فشل في الوصول إلى الملف الشخصي] ، يرجى إعادة تثبيت التطبيق';
	@override String get invalidVersion => 'فشل التطبيق في بدء [إصدار غير صالح] ، يرجى إعادة تثبيت التطبيق';
	@override String get systemVersionLow => 'فشل بدء تشغيل التطبيق [إصدار النظام منخفض جدًا]';
	@override String get invalidInstallPath => 'مسار التثبيت غير صالح ، يرجى إعادة تثبيته إلى مسار صالح';
}

// Path: main
class _TranslationsMainAr implements TranslationsMainEn {
	_TranslationsMainAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMainTrayAr tray = _TranslationsMainTrayAr._(_root);
}

// Path: meta
class _TranslationsMetaAr implements TranslationsMetaEn {
	_TranslationsMetaAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get enable => 'يُمكَِن';
	@override String get disable => 'إبطال';
	@override String get open => 'يفتح';
	@override String get close => 'إنهاء';
	@override String get quit => 'يترك';
	@override String get more => 'أكثر';
	@override String get tips => 'معلومات';
	@override String get copy => 'ينسخ';
	@override String get save => 'يحفظ';
	@override String get ok => 'نعم';
	@override String get cancel => 'يلغي';
	@override String get faq => 'أسئلة مكررة';
	@override String get download => 'تحميل';
	@override String get loading => 'تحميل...';
	@override String get days => 'أيام';
	@override String get hours => 'ساعات';
	@override String get minutes => 'دقائق';
	@override String get seconds => 'ثانية';
	@override String get connect => 'يتصل';
	@override String get disconnect => 'قطع الاتصال';
	@override String get connected => 'متصل';
	@override String get disconnected => 'انقطع الاتصال';
	@override String get connecting => 'توصيل';
	@override String get connectTimeout => 'ربط مهلة';
	@override String get timeout => 'نفذ الوقت';
	@override String get timeoutDuration => 'مدة مهلة الانتظار';
	@override String get language => 'لغة';
	@override String get next => 'التالي';
	@override String get done => 'منتهي';
	@override String get none => 'لا أحد';
	@override String get reset => 'إعادة ضبط';
	@override String get required => 'مطلوب';
	@override String get other => 'آخر';
	@override String get launchAtStartup => 'إطلاق عند بدء التشغيل';
	@override String get autoConnectAfterLaunch => 'اتصال السيارات بعد الإطلاق';
	@override String get hideAfterLaunch => 'إخفاء النافذة بعد بدء التشغيل';
	@override String get website => 'موقع إلكتروني';
	@override String get termOfUse => 'شرط الخدمة';
	@override String get privacyPolicy => 'سياسة الخصوصية';
	@override String get log => 'سجل';
	@override String get coreLog => 'سجل النواة';
	@override String get core => 'جوهر';
	@override String get help => 'يساعد';
	@override String get tutorial => 'درس تعليمي';
	@override String get proxy => 'التمثيل';
	@override String get theme => 'سمة';
	@override String get autoUpdate => 'التحديثات التلقائية';
	@override String get updateChannel => 'تحديث القنوات تلقائيا';
	@override String hasNewVersion({required Object p}) => 'تحديث الإصدار ${p}';
	@override String get devOptions => 'خيارات للمطور';
	@override String get about => 'عن';
	@override String get name => 'اسم';
	@override String get version => 'إصدار';
	@override String get share => 'يشارك';
	@override String get server => 'الخادم';
	@override String get port => 'ميناء';
	@override String get donate => 'يتبرع';
	@override String get setting => 'إعدادات';
	@override String get deviceNoSpace => 'مساحة غير كافيه في القرص';
	@override String get openDir => 'فتح دليل الملف';
}

// Path: main.tray
class _TranslationsMainTrayAr implements TranslationsMainTrayEn {
	_TranslationsMainTrayAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => '    يفتح    ';
	@override String get menuExit => '    مخرج    ';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'LaunchFailedScreen.invalidProcess' => 'فشل التطبيق في البدء [اسم عملية غير صالح] ، يرجى إعادة تثبيت التطبيق إلى دليل منفصل',
			'LaunchFailedScreen.invalidProfile' => 'فشل التطبيق في البدء [فشل في الوصول إلى الملف الشخصي] ، يرجى إعادة تثبيت التطبيق',
			'LaunchFailedScreen.invalidVersion' => 'فشل التطبيق في بدء [إصدار غير صالح] ، يرجى إعادة تثبيت التطبيق',
			'LaunchFailedScreen.systemVersionLow' => 'فشل بدء تشغيل التطبيق [إصدار النظام منخفض جدًا]',
			'LaunchFailedScreen.invalidInstallPath' => 'مسار التثبيت غير صالح ، يرجى إعادة تثبيته إلى مسار صالح',
			'main.tray.menuOpen' => '    يفتح    ',
			'main.tray.menuExit' => '    مخرج    ',
			'meta.enable' => 'يُمكَِن',
			'meta.disable' => 'إبطال',
			'meta.open' => 'يفتح',
			'meta.close' => 'إنهاء',
			'meta.quit' => 'يترك',
			'meta.more' => 'أكثر',
			'meta.tips' => 'معلومات',
			'meta.copy' => 'ينسخ',
			'meta.save' => 'يحفظ',
			'meta.ok' => 'نعم',
			'meta.cancel' => 'يلغي',
			'meta.faq' => 'أسئلة مكررة',
			'meta.download' => 'تحميل',
			'meta.loading' => 'تحميل...',
			'meta.days' => 'أيام',
			'meta.hours' => 'ساعات',
			'meta.minutes' => 'دقائق',
			'meta.seconds' => 'ثانية',
			'meta.connect' => 'يتصل',
			'meta.disconnect' => 'قطع الاتصال',
			'meta.connected' => 'متصل',
			'meta.disconnected' => 'انقطع الاتصال',
			'meta.connecting' => 'توصيل',
			'meta.connectTimeout' => 'ربط مهلة',
			'meta.timeout' => 'نفذ الوقت',
			'meta.timeoutDuration' => 'مدة مهلة الانتظار',
			'meta.language' => 'لغة',
			'meta.next' => 'التالي',
			'meta.done' => 'منتهي',
			'meta.none' => 'لا أحد',
			'meta.reset' => 'إعادة ضبط',
			'meta.required' => 'مطلوب',
			'meta.other' => 'آخر',
			'meta.launchAtStartup' => 'إطلاق عند بدء التشغيل',
			'meta.autoConnectAfterLaunch' => 'اتصال السيارات بعد الإطلاق',
			'meta.hideAfterLaunch' => 'إخفاء النافذة بعد بدء التشغيل',
			'meta.website' => 'موقع إلكتروني',
			'meta.termOfUse' => 'شرط الخدمة',
			'meta.privacyPolicy' => 'سياسة الخصوصية',
			'meta.log' => 'سجل',
			'meta.coreLog' => 'سجل النواة',
			'meta.core' => 'جوهر',
			'meta.help' => 'يساعد',
			'meta.tutorial' => 'درس تعليمي',
			'meta.proxy' => 'التمثيل',
			'meta.theme' => 'سمة',
			'meta.autoUpdate' => 'التحديثات التلقائية',
			'meta.updateChannel' => 'تحديث القنوات تلقائيا',
			'meta.hasNewVersion' => ({required Object p}) => 'تحديث الإصدار ${p}',
			'meta.devOptions' => 'خيارات للمطور',
			'meta.about' => 'عن',
			'meta.name' => 'اسم',
			'meta.version' => 'إصدار',
			'meta.share' => 'يشارك',
			'meta.server' => 'الخادم',
			'meta.port' => 'ميناء',
			'meta.donate' => 'يتبرع',
			'meta.setting' => 'إعدادات',
			'meta.deviceNoSpace' => 'مساحة غير كافيه في القرص',
			'meta.openDir' => 'فتح دليل الملف',
			'locales.en' => 'English',
			'locales.zh-CN' => '简体中文',
			'locales.ar' => 'عربي',
			'locales.ru' => 'Русский',
			'locales.fa' => 'فارسی',
			_ => null,
		};
	}
}
