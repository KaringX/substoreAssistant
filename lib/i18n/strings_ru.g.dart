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
class TranslationsRu with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsLaunchFailedScreenRu LaunchFailedScreen = _TranslationsLaunchFailedScreenRu._(_root);
	@override late final _TranslationsMainRu main = _TranslationsMainRu._(_root);
	@override late final _TranslationsMetaRu meta = _TranslationsMetaRu._(_root);
	@override Map<String, String> get locales => {
		'en': 'English',
		'zh-CN': '简体中文',
		'ar': 'عربي',
		'ru': 'Русский',
		'fa': 'فارسی',
	};
}

// Path: LaunchFailedScreen
class _TranslationsLaunchFailedScreenRu implements TranslationsLaunchFailedScreenEn {
	_TranslationsLaunchFailedScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => 'Не удалось запустить приложение [Неверное имя процесса], переустановите приложение в отдельную папку';
	@override String get invalidProfile => 'Не удалось запустить приложение [Не удалось получить доступ к профилю], переустановите приложение';
	@override String get invalidVersion => 'Не удалось запустить приложение [Неверная версия], переустановите приложение';
	@override String get systemVersionLow => 'Не удалось запустить приложение [Слишком низкая версия системы]';
	@override String get invalidInstallPath => 'Путь установки недействителен, переустановите его по допустимому пути';
}

// Path: main
class _TranslationsMainRu implements TranslationsMainEn {
	_TranslationsMainRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMainTrayRu tray = _TranslationsMainTrayRu._(_root);
}

// Path: meta
class _TranslationsMetaRu implements TranslationsMetaEn {
	_TranslationsMetaRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get enable => 'Включить';
	@override String get disable => 'Запретить';
	@override String get open => 'Открыть';
	@override String get close => 'Закрыть';
	@override String get quit => 'Выйти';
	@override String get more => 'Больше';
	@override String get tips => 'Инфо';
	@override String get copy => 'Скопировать';
	@override String get save => 'сохранять';
	@override String get ok => 'Ок';
	@override String get cancel => 'Закрыть';
	@override String get faq => 'Часто задаваемые вопросы (FAQ)';
	@override String get download => 'Скачать';
	@override String get loading => 'Загрузка...';
	@override String get days => 'дни';
	@override String get hours => 'часы';
	@override String get minutes => 'минуты';
	@override String get seconds => 'Второй';
	@override String get connected => 'Остановлено';
	@override String get disconnected => 'Остановлено';
	@override String get language => 'Язык';
	@override String get next => 'Дальше';
	@override String get done => 'Готово';
	@override String get none => 'Ничего не делать';
	@override String get reset => 'Перезагрузить';
	@override String get required => 'Необходимо';
	@override String get other => 'Другой';
	@override String get launchAtStartup => 'Запуск при включении';
	@override String get autoConnectAfterLaunch => 'Автоматическое подключение после запуска';
	@override String get hideAfterLaunch => 'Скрыть окно после запуска';
	@override String get termOfUse => 'Условия использования';
	@override String get privacyPolicy => 'Политика конфиденциальности';
	@override String get log => 'Журнал';
	@override String get coreLog => 'Журнал ядра';
	@override String get core => 'Ядро';
	@override String get help => 'Помощь';
	@override String get tutorial => 'Руководство';
	@override String get theme => 'Тема';
	@override String get autoUpdate => 'Автоматические обновления';
	@override String get updateChannel => 'Канал автоматического обновления';
	@override String hasNewVersion({required Object p}) => 'Обновить версию ${p}';
	@override String get devOptions => 'Параметры разработчика';
	@override String get about => 'О приложении';
	@override String get name => 'Название';
	@override String get version => 'Версия';
	@override String get share => 'Поделиться';
	@override String get server => 'Сервер';
	@override String get port => 'Порт';
	@override String get frontendPort => 'Передний порт';
	@override String get backendPort => 'порт бэкэнда';
	@override String get donate => 'Пожертвовать';
	@override String get setting => 'Настройки';
	@override String get deviceNoSpace => 'Недостаточно места на диске';
	@override String get openDir => 'Открыть каталог файлов';
}

// Path: main.tray
class _TranslationsMainTrayRu implements TranslationsMainTrayEn {
	_TranslationsMainTrayRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => '    Открыть    ';
	@override String get menuExit => '    Выйти    ';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'LaunchFailedScreen.invalidProcess' => 'Не удалось запустить приложение [Неверное имя процесса], переустановите приложение в отдельную папку',
			'LaunchFailedScreen.invalidProfile' => 'Не удалось запустить приложение [Не удалось получить доступ к профилю], переустановите приложение',
			'LaunchFailedScreen.invalidVersion' => 'Не удалось запустить приложение [Неверная версия], переустановите приложение',
			'LaunchFailedScreen.systemVersionLow' => 'Не удалось запустить приложение [Слишком низкая версия системы]',
			'LaunchFailedScreen.invalidInstallPath' => 'Путь установки недействителен, переустановите его по допустимому пути',
			'main.tray.menuOpen' => '    Открыть    ',
			'main.tray.menuExit' => '    Выйти    ',
			'meta.enable' => 'Включить',
			'meta.disable' => 'Запретить',
			'meta.open' => 'Открыть',
			'meta.close' => 'Закрыть',
			'meta.quit' => 'Выйти',
			'meta.more' => 'Больше',
			'meta.tips' => 'Инфо',
			'meta.copy' => 'Скопировать',
			'meta.save' => 'сохранять',
			'meta.ok' => 'Ок',
			'meta.cancel' => 'Закрыть',
			'meta.faq' => 'Часто задаваемые вопросы (FAQ)',
			'meta.download' => 'Скачать',
			'meta.loading' => 'Загрузка...',
			'meta.days' => 'дни',
			'meta.hours' => 'часы',
			'meta.minutes' => 'минуты',
			'meta.seconds' => 'Второй',
			'meta.connected' => 'Остановлено',
			'meta.disconnected' => 'Остановлено',
			'meta.language' => 'Язык',
			'meta.next' => 'Дальше',
			'meta.done' => 'Готово',
			'meta.none' => 'Ничего не делать',
			'meta.reset' => 'Перезагрузить',
			'meta.required' => 'Необходимо',
			'meta.other' => 'Другой',
			'meta.launchAtStartup' => 'Запуск при включении',
			'meta.autoConnectAfterLaunch' => 'Автоматическое подключение после запуска',
			'meta.hideAfterLaunch' => 'Скрыть окно после запуска',
			'meta.termOfUse' => 'Условия использования',
			'meta.privacyPolicy' => 'Политика конфиденциальности',
			'meta.log' => 'Журнал',
			'meta.coreLog' => 'Журнал ядра',
			'meta.core' => 'Ядро',
			'meta.help' => 'Помощь',
			'meta.tutorial' => 'Руководство',
			'meta.theme' => 'Тема',
			'meta.autoUpdate' => 'Автоматические обновления',
			'meta.updateChannel' => 'Канал автоматического обновления',
			'meta.hasNewVersion' => ({required Object p}) => 'Обновить версию ${p}',
			'meta.devOptions' => 'Параметры разработчика',
			'meta.about' => 'О приложении',
			'meta.name' => 'Название',
			'meta.version' => 'Версия',
			'meta.share' => 'Поделиться',
			'meta.server' => 'Сервер',
			'meta.port' => 'Порт',
			'meta.frontendPort' => 'Передний порт',
			'meta.backendPort' => 'порт бэкэнда',
			'meta.donate' => 'Пожертвовать',
			'meta.setting' => 'Настройки',
			'meta.deviceNoSpace' => 'Недостаточно места на диске',
			'meta.openDir' => 'Открыть каталог файлов',
			'locales.en' => 'English',
			'locales.zh-CN' => '简体中文',
			'locales.ar' => 'عربي',
			'locales.ru' => 'Русский',
			'locales.fa' => 'فارسی',
			_ => null,
		};
	}
}
