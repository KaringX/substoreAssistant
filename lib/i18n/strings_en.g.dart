///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsLaunchFailedScreenEn LaunchFailedScreen = TranslationsLaunchFailedScreenEn._(_root);
	late final TranslationsMainEn main = TranslationsMainEn._(_root);
	late final TranslationsMetaEn meta = TranslationsMetaEn._(_root);
	Map<String, String> get locales => {
		'en': 'English',
		'zh-CN': '简体中文',
		'ar': 'عربي',
		'ru': 'Русский',
		'fa': 'فارسی',
	};
}

// Path: LaunchFailedScreen
class TranslationsLaunchFailedScreenEn {
	TranslationsLaunchFailedScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The app failed to start [Invalid process name], please reinstall the app to a separate directory'
	String get invalidProcess => 'The app failed to start [Invalid process name], please reinstall the app to a separate directory';

	/// en: 'The app failed to start [Failed to access the profile], please reinstall the app'
	String get invalidProfile => 'The app failed to start [Failed to access the profile], please reinstall the app';

	/// en: 'The app failed to start [Invalid version], please reinstall the app'
	String get invalidVersion => 'The app failed to start [Invalid version], please reinstall the app';

	/// en: 'The app failed to start [system version too low]'
	String get systemVersionLow => 'The app failed to start [system version too low]';

	/// en: 'The installation path is invalid, please reinstall it to a valid path'
	String get invalidInstallPath => 'The installation path is invalid, please reinstall it to a valid path';
}

// Path: main
class TranslationsMainEn {
	TranslationsMainEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsMainTrayEn tray = TranslationsMainTrayEn._(_root);
}

// Path: meta
class TranslationsMetaEn {
	TranslationsMetaEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Enable'
	String get enable => 'Enable';

	/// en: 'Disable'
	String get disable => 'Disable';

	/// en: 'Open'
	String get open => 'Open';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Quit'
	String get quit => 'Quit';

	/// en: 'More'
	String get more => 'More';

	/// en: 'Info'
	String get tips => 'Info';

	/// en: 'Copy'
	String get copy => 'Copy';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Ok'
	String get ok => 'Ok';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'FAQ'
	String get faq => 'FAQ';

	/// en: 'Download'
	String get download => 'Download';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Days'
	String get days => 'Days';

	/// en: 'Hours'
	String get hours => 'Hours';

	/// en: 'Minutes'
	String get minutes => 'Minutes';

	/// en: 'Seconds'
	String get seconds => 'Seconds';

	/// en: 'Connect'
	String get connect => 'Connect';

	/// en: 'Disconnect'
	String get disconnect => 'Disconnect';

	/// en: 'Connected'
	String get connected => 'Connected';

	/// en: 'Disconnected'
	String get disconnected => 'Disconnected';

	/// en: 'Connecting'
	String get connecting => 'Connecting';

	/// en: 'Connect Timeout'
	String get connectTimeout => 'Connect Timeout';

	/// en: 'Timeout'
	String get timeout => 'Timeout';

	/// en: 'Timeout Duration'
	String get timeoutDuration => 'Timeout Duration';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'None'
	String get none => 'None';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'Required'
	String get required => 'Required';

	/// en: 'Other'
	String get other => 'Other';

	/// en: 'Launch at Startup'
	String get launchAtStartup => 'Launch at Startup';

	/// en: 'Auto Connection after Launch'
	String get autoConnectAfterLaunch => 'Auto Connection after Launch';

	/// en: 'Hide window after startup'
	String get hideAfterLaunch => 'Hide window after startup';

	/// en: 'Terms of Service'
	String get termOfUse => 'Terms of Service';

	/// en: 'Privacy & Policy'
	String get privacyPolicy => 'Privacy & Policy';

	/// en: 'Log'
	String get log => 'Log';

	/// en: 'Core Log'
	String get coreLog => 'Core Log';

	/// en: 'Core'
	String get core => 'Core';

	/// en: 'Help'
	String get help => 'Help';

	/// en: 'Tutorial'
	String get tutorial => 'Tutorial';

	/// en: 'Proxy'
	String get proxy => 'Proxy';

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'Auto Update'
	String get autoUpdate => 'Auto Update';

	/// en: 'Auto Update Channel'
	String get updateChannel => 'Auto Update Channel';

	/// en: 'Update Version $p'
	String hasNewVersion({required Object p}) => 'Update Version ${p}';

	/// en: 'Developer Options'
	String get devOptions => 'Developer Options';

	/// en: 'About'
	String get about => 'About';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Version'
	String get version => 'Version';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'Server'
	String get server => 'Server';

	/// en: 'Port'
	String get port => 'Port';

	/// en: 'Donate'
	String get donate => 'Donate';

	/// en: 'Settings'
	String get setting => 'Settings';

	/// en: 'Not enough disk space'
	String get deviceNoSpace => 'Not enough disk space';

	/// en: 'Open File Directory'
	String get openDir => 'Open File Directory';
}

// Path: main.tray
class TranslationsMainTrayEn {
	TranslationsMainTrayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: ' Open '
	String get menuOpen => '    Open    ';

	/// en: ' Exit '
	String get menuExit => '    Exit    ';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'LaunchFailedScreen.invalidProcess' => 'The app failed to start [Invalid process name], please reinstall the app to a separate directory',
			'LaunchFailedScreen.invalidProfile' => 'The app failed to start [Failed to access the profile], please reinstall the app',
			'LaunchFailedScreen.invalidVersion' => 'The app failed to start [Invalid version], please reinstall the app',
			'LaunchFailedScreen.systemVersionLow' => 'The app failed to start [system version too low]',
			'LaunchFailedScreen.invalidInstallPath' => 'The installation path is invalid, please reinstall it to a valid path',
			'main.tray.menuOpen' => '    Open    ',
			'main.tray.menuExit' => '    Exit    ',
			'meta.enable' => 'Enable',
			'meta.disable' => 'Disable',
			'meta.open' => 'Open',
			'meta.close' => 'Close',
			'meta.quit' => 'Quit',
			'meta.more' => 'More',
			'meta.tips' => 'Info',
			'meta.copy' => 'Copy',
			'meta.save' => 'Save',
			'meta.ok' => 'Ok',
			'meta.cancel' => 'Cancel',
			'meta.faq' => 'FAQ',
			'meta.download' => 'Download',
			'meta.loading' => 'Loading...',
			'meta.days' => 'Days',
			'meta.hours' => 'Hours',
			'meta.minutes' => 'Minutes',
			'meta.seconds' => 'Seconds',
			'meta.connect' => 'Connect',
			'meta.disconnect' => 'Disconnect',
			'meta.connected' => 'Connected',
			'meta.disconnected' => 'Disconnected',
			'meta.connecting' => 'Connecting',
			'meta.connectTimeout' => 'Connect Timeout',
			'meta.timeout' => 'Timeout',
			'meta.timeoutDuration' => 'Timeout Duration',
			'meta.language' => 'Language',
			'meta.next' => 'Next',
			'meta.done' => 'Done',
			'meta.none' => 'None',
			'meta.reset' => 'Reset',
			'meta.required' => 'Required',
			'meta.other' => 'Other',
			'meta.launchAtStartup' => 'Launch at Startup',
			'meta.autoConnectAfterLaunch' => 'Auto Connection after Launch',
			'meta.hideAfterLaunch' => 'Hide window after startup',
			'meta.termOfUse' => 'Terms of Service',
			'meta.privacyPolicy' => 'Privacy & Policy',
			'meta.log' => 'Log',
			'meta.coreLog' => 'Core Log',
			'meta.core' => 'Core',
			'meta.help' => 'Help',
			'meta.tutorial' => 'Tutorial',
			'meta.proxy' => 'Proxy',
			'meta.theme' => 'Theme',
			'meta.autoUpdate' => 'Auto Update',
			'meta.updateChannel' => 'Auto Update Channel',
			'meta.hasNewVersion' => ({required Object p}) => 'Update Version ${p}',
			'meta.devOptions' => 'Developer Options',
			'meta.about' => 'About',
			'meta.name' => 'Name',
			'meta.version' => 'Version',
			'meta.share' => 'Share',
			'meta.server' => 'Server',
			'meta.port' => 'Port',
			'meta.donate' => 'Donate',
			'meta.setting' => 'Settings',
			'meta.deviceNoSpace' => 'Not enough disk space',
			'meta.openDir' => 'Open File Directory',
			'locales.en' => 'English',
			'locales.zh-CN' => '简体中文',
			'locales.ar' => 'عربي',
			'locales.ru' => 'Русский',
			'locales.fa' => 'فارسی',
			_ => null,
		};
	}
}
