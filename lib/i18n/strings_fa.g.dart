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
class TranslationsFa with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fa,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fa>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFa _root = this; // ignore: unused_field

	@override 
	TranslationsFa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFa(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsLaunchFailedScreenFa LaunchFailedScreen = _TranslationsLaunchFailedScreenFa._(_root);
	@override late final _TranslationsMainFa main = _TranslationsMainFa._(_root);
	@override late final _TranslationsMetaFa meta = _TranslationsMetaFa._(_root);
	@override Map<String, String> get locales => {
		'en': 'English',
		'zh-CN': '简体中文',
		'ar': 'عربي',
		'ru': 'Русский',
		'fa': 'فارسی',
	};
}

// Path: LaunchFailedScreen
class _TranslationsLaunchFailedScreenFa implements TranslationsLaunchFailedScreenEn {
	_TranslationsLaunchFailedScreenFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => 'اجرای نرم‌افزار ناموفق بود [نام‌ اجرایی پروسه نامعتبر]، لطفا مجدد نرم‌افزار را در دایرکتوری دیگری نصب کنید';
	@override String get invalidProfile => 'اجرای نرم‌افزار ناموفق بود [دسترسی به پروفایل ناموفق بود]، لطفا مجدد نرم افزار را نصب کنید';
	@override String get invalidVersion => 'اجرای نرم‌افزار ناموفق بود [ورژن نامعتبر]، لطفا مجدد نرم‌افزار را نصب کنید';
	@override String get systemVersionLow => 'راه اندازی برنامه ناموفق بود [نسخه سیستم خیلی کم است]';
	@override String get invalidInstallPath => 'مسیر نصب نامعتبر است، لطفا مجدد در مسیر معتبر نصب کنید';
}

// Path: main
class _TranslationsMainFa implements TranslationsMainEn {
	_TranslationsMainFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMainTrayFa tray = _TranslationsMainTrayFa._(_root);
}

// Path: meta
class _TranslationsMetaFa implements TranslationsMetaEn {
	_TranslationsMetaFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get enable => 'فعال‌سازی';
	@override String get disable => 'غیرفعال';
	@override String get open => 'باز کن';
	@override String get close => 'بسته';
	@override String get quit => 'خروج';
	@override String get more => 'بیشتر';
	@override String get tips => 'اطلاعات';
	@override String get copy => 'کپی';
	@override String get save => 'ذخیره کنید';
	@override String get ok => 'خُب';
	@override String get cancel => 'لغو';
	@override String get faq => 'سوالات متداول';
	@override String get download => 'دانلود';
	@override String get loading => 'درحال بارگذاری…';
	@override String get days => 'روز';
	@override String get hours => 'ساعت';
	@override String get minutes => 'دقیقه';
	@override String get seconds => 'دومین';
	@override String get connected => 'متوقف شد';
	@override String get disconnected => 'قطع شد';
	@override String get language => 'زبان';
	@override String get next => 'بعدی';
	@override String get done => 'انجام‌شد';
	@override String get none => 'هیچ‌کدام';
	@override String get reset => 'ریست';
	@override String get required => 'الزامی';
	@override String get other => 'دیگر';
	@override String get launchAtStartup => 'اجرا در راه‌اندازی';
	@override String get autoConnectAfterLaunch => 'اتصال خودکار پس‌از راه‌اندازی';
	@override String get hideAfterLaunch => 'پنهان کردن پنجره پس از راه اندازی';
	@override String get termOfUse => 'شرایط استفاده';
	@override String get privacyPolicy => 'سیاست حریم خصوصی';
	@override String get log => 'ورود به سیستم';
	@override String get coreLog => 'گزارش هسته';
	@override String get core => 'هسته';
	@override String get help => 'کمک کند';
	@override String get tutorial => 'آموزش';
	@override String get theme => 'موضوع';
	@override String get autoUpdate => 'به روز رسانی خودکار';
	@override String get updateChannel => 'کانال به‌روزرسانی خودکار';
	@override String hasNewVersion({required Object p}) => 'به‌روزرسانی نسخه ${p} ';
	@override String get devOptions => 'تنظیمات توسعه‌دهندگان';
	@override String get about => 'درباره';
	@override String get name => 'نام';
	@override String get version => 'نسخه';
	@override String get share => 'اشتراک گذاری';
	@override String get server => 'سرور';
	@override String get port => 'بندر';
	@override String get frontendPort => 'پورت جلویی';
	@override String get backendPort => 'پورت بک‌اند';
	@override String get donate => 'اهدا کنید';
	@override String get setting => 'تنظیمات';
	@override String get deviceNoSpace => 'فضای خالی کافی ندارید';
	@override String get openDir => 'بازکردن دایرکتوری فایل';
}

// Path: main.tray
class _TranslationsMainTrayFa implements TranslationsMainTrayEn {
	_TranslationsMainTrayFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => '    بازکردن    ';
	@override String get menuExit => '    بستن    ';
}

/// The flat map containing all translations for locale <fa>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'LaunchFailedScreen.invalidProcess' => 'اجرای نرم‌افزار ناموفق بود [نام‌ اجرایی پروسه نامعتبر]، لطفا مجدد نرم‌افزار را در دایرکتوری دیگری نصب کنید',
			'LaunchFailedScreen.invalidProfile' => 'اجرای نرم‌افزار ناموفق بود [دسترسی به پروفایل ناموفق بود]، لطفا مجدد نرم افزار را نصب کنید',
			'LaunchFailedScreen.invalidVersion' => 'اجرای نرم‌افزار ناموفق بود [ورژن نامعتبر]، لطفا مجدد نرم‌افزار را نصب کنید',
			'LaunchFailedScreen.systemVersionLow' => 'راه اندازی برنامه ناموفق بود [نسخه سیستم خیلی کم است]',
			'LaunchFailedScreen.invalidInstallPath' => 'مسیر نصب نامعتبر است، لطفا مجدد در مسیر معتبر نصب کنید',
			'main.tray.menuOpen' => '    بازکردن    ',
			'main.tray.menuExit' => '    بستن    ',
			'meta.enable' => 'فعال‌سازی',
			'meta.disable' => 'غیرفعال',
			'meta.open' => 'باز کن',
			'meta.close' => 'بسته',
			'meta.quit' => 'خروج',
			'meta.more' => 'بیشتر',
			'meta.tips' => 'اطلاعات',
			'meta.copy' => 'کپی',
			'meta.save' => 'ذخیره کنید',
			'meta.ok' => 'خُب',
			'meta.cancel' => 'لغو',
			'meta.faq' => 'سوالات متداول',
			'meta.download' => 'دانلود',
			'meta.loading' => 'درحال بارگذاری…',
			'meta.days' => 'روز',
			'meta.hours' => 'ساعت',
			'meta.minutes' => 'دقیقه',
			'meta.seconds' => 'دومین',
			'meta.connected' => 'متوقف شد',
			'meta.disconnected' => 'قطع شد',
			'meta.language' => 'زبان',
			'meta.next' => 'بعدی',
			'meta.done' => 'انجام‌شد',
			'meta.none' => 'هیچ‌کدام',
			'meta.reset' => 'ریست',
			'meta.required' => 'الزامی',
			'meta.other' => 'دیگر',
			'meta.launchAtStartup' => 'اجرا در راه‌اندازی',
			'meta.autoConnectAfterLaunch' => 'اتصال خودکار پس‌از راه‌اندازی',
			'meta.hideAfterLaunch' => 'پنهان کردن پنجره پس از راه اندازی',
			'meta.termOfUse' => 'شرایط استفاده',
			'meta.privacyPolicy' => 'سیاست حریم خصوصی',
			'meta.log' => 'ورود به سیستم',
			'meta.coreLog' => 'گزارش هسته',
			'meta.core' => 'هسته',
			'meta.help' => 'کمک کند',
			'meta.tutorial' => 'آموزش',
			'meta.theme' => 'موضوع',
			'meta.autoUpdate' => 'به روز رسانی خودکار',
			'meta.updateChannel' => 'کانال به‌روزرسانی خودکار',
			'meta.hasNewVersion' => ({required Object p}) => 'به‌روزرسانی نسخه ${p} ',
			'meta.devOptions' => 'تنظیمات توسعه‌دهندگان',
			'meta.about' => 'درباره',
			'meta.name' => 'نام',
			'meta.version' => 'نسخه',
			'meta.share' => 'اشتراک گذاری',
			'meta.server' => 'سرور',
			'meta.port' => 'بندر',
			'meta.frontendPort' => 'پورت جلویی',
			'meta.backendPort' => 'پورت بک‌اند',
			'meta.donate' => 'اهدا کنید',
			'meta.setting' => 'تنظیمات',
			'meta.deviceNoSpace' => 'فضای خالی کافی ندارید',
			'meta.openDir' => 'بازکردن دایرکتوری فایل',
			'locales.en' => 'English',
			'locales.zh-CN' => '简体中文',
			'locales.ar' => 'عربي',
			'locales.ru' => 'Русский',
			'locales.fa' => 'فارسی',
			_ => null,
		};
	}
}
