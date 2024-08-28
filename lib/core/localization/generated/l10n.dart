// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class I10n {
  I10n();

  static I10n? _current;

  static I10n get current {
    assert(_current != null,
        'No instance of I10n was loaded. Try to initialize the I10n delegate before accessing I10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I10n();
      I10n._current = instance;

      return instance;
    });
  }

  static I10n of(BuildContext context) {
    final instance = I10n.maybeOf(context);
    assert(instance != null,
        'No instance of I10n present in the widget tree. Did you add I10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I10n? maybeOf(BuildContext context) {
    return Localizations.of<I10n>(context, I10n);
  }

  /// `Scouts Chaudière-Ouest`
  String get appTitle {
    return Intl.message(
      'Scouts Chaudière-Ouest',
      name: 'appTitle',
      desc: 'Scouts Chaudière-Ouest',
      args: [],
    );
  }

  /// `Navigation`
  String get navTitle {
    return Intl.message(
      'Navigation',
      name: 'navTitle',
      desc: 'Navigation',
      args: [],
    );
  }

  /// `Scouts`
  String get navTitleScout {
    return Intl.message(
      'Scouts',
      name: 'navTitleScout',
      desc: 'Scouts',
      args: [],
    );
  }

  /// `Inscriptions`
  String get navTitleInscription {
    return Intl.message(
      'Inscriptions',
      name: 'navTitleInscription',
      desc: 'Inscriptions',
      args: [],
    );
  }

  /// `Settings`
  String get navTitleSettings {
    return Intl.message(
      'Settings',
      name: 'navTitleSettings',
      desc: 'Settings',
      args: [],
    );
  }

  /// `Castors`
  String get pageScoutHeaderCastors {
    return Intl.message(
      'Castors',
      name: 'pageScoutHeaderCastors',
      desc: 'Castors',
      args: [],
    );
  }

  /// `Louveteaux`
  String get pageScoutHeaderLouveteaux {
    return Intl.message(
      'Louveteaux',
      name: 'pageScoutHeaderLouveteaux',
      desc: 'Louveteaux',
      args: [],
    );
  }

  /// `Aventuriers`
  String get pageScoutHeaderAventuriers {
    return Intl.message(
      'Aventuriers',
      name: 'pageScoutHeaderAventuriers',
      desc: 'Aventuriers',
      args: [],
    );
  }

  /// `Routiers`
  String get pageScoutHeaderRoutiers {
    return Intl.message(
      'Routiers',
      name: 'pageScoutHeaderRoutiers',
      desc: 'Routiers',
      args: [],
    );
  }

  /// `Not Paid`
  String get pageInscriptionsHeaderNotPaid {
    return Intl.message(
      'Not Paid',
      name: 'pageInscriptionsHeaderNotPaid',
      desc: 'Not Paid',
      args: [],
    );
  }

  /// `Paid`
  String get pageInscriptionsHeaderPaid {
    return Intl.message(
      'Paid',
      name: 'pageInscriptionsHeaderPaid',
      desc: 'Paid',
      args: [],
    );
  }

  /// `First Name`
  String get listViewHeaderFirstName {
    return Intl.message(
      'First Name',
      name: 'listViewHeaderFirstName',
      desc: 'First Name',
      args: [],
    );
  }

  /// `Last Name`
  String get listViewHeaderLastName {
    return Intl.message(
      'Last Name',
      name: 'listViewHeaderLastName',
      desc: 'Last Name',
      args: [],
    );
  }

  /// `Age`
  String get listViewHeaderAge {
    return Intl.message(
      'Age',
      name: 'listViewHeaderAge',
      desc: 'Age',
      args: [],
    );
  }

  /// `Search`
  String get formSearchBar {
    return Intl.message(
      'Search',
      name: 'formSearchBar',
      desc: 'Search',
      args: [],
    );
  }

  /// `Attendance Sheet`
  String get formButtonsAttendanceTooltip {
    return Intl.message(
      'Attendance Sheet',
      name: 'formButtonsAttendanceTooltip',
      desc: 'Attendance Sheet',
      args: [],
    );
  }

  /// `Add New`
  String get formButtonsAddNewTooltip {
    return Intl.message(
      'Add New',
      name: 'formButtonsAddNewTooltip',
      desc: 'Add New',
      args: [],
    );
  }

  /// `Edit`
  String get formButtonsEditTooltip {
    return Intl.message(
      'Edit',
      name: 'formButtonsEditTooltip',
      desc: 'Edit',
      args: [],
    );
  }

  /// `Save`
  String get formButtonsSaveTooltip {
    return Intl.message(
      'Save',
      name: 'formButtonsSaveTooltip',
      desc: 'Save',
      args: [],
    );
  }

  /// `Cancel`
  String get formButtonsCancelTooltip {
    return Intl.message(
      'Cancel',
      name: 'formButtonsCancelTooltip',
      desc: 'Cancel',
      args: [],
    );
  }

  /// `Paid`
  String get formButtonsPaidTooltip {
    return Intl.message(
      'Paid',
      name: 'formButtonsPaidTooltip',
      desc: 'Paid',
      args: [],
    );
  }

  /// `Health Sheet`
  String get formButtonsHealthSheetTooltip {
    return Intl.message(
      'Health Sheet',
      name: 'formButtonsHealthSheetTooltip',
      desc: 'Health Sheet',
      args: [],
    );
  }

  /// `Personal Informations`
  String get formCardHeaderPersonalInformations {
    return Intl.message(
      'Personal Informations',
      name: 'formCardHeaderPersonalInformations',
      desc: 'Personal Informations',
      args: [],
    );
  }

  /// `Parent 1`
  String get formCardHeaderParent1 {
    return Intl.message(
      'Parent 1',
      name: 'formCardHeaderParent1',
      desc: 'Parent 1',
      args: [],
    );
  }

  /// `Parent 2`
  String get formCardHeaderParent2 {
    return Intl.message(
      'Parent 2',
      name: 'formCardHeaderParent2',
      desc: 'Parent 2',
      args: [],
    );
  }

  /// `First Name`
  String get formFieldFirstName {
    return Intl.message(
      'First Name',
      name: 'formFieldFirstName',
      desc: 'First Name',
      args: [],
    );
  }

  /// `Last Name`
  String get formFieldLastName {
    return Intl.message(
      'Last Name',
      name: 'formFieldLastName',
      desc: 'Last Name',
      args: [],
    );
  }

  /// `Phone Number`
  String get formFieldPhone {
    return Intl.message(
      'Phone Number',
      name: 'formFieldPhone',
      desc: 'Phone Number',
      args: [],
    );
  }

  /// `E-mail`
  String get formFieldEmail {
    return Intl.message(
      'E-mail',
      name: 'formFieldEmail',
      desc: 'E-mail',
      args: [],
    );
  }

  /// `Date of Birth (YYYY-MM-DD)`
  String get formFieldDoB {
    return Intl.message(
      'Date of Birth (YYYY-MM-DD)',
      name: 'formFieldDoB',
      desc: 'Date of Birth (YYYY-MM-DD)',
      args: [],
    );
  }

  /// `Age`
  String get formFieldAge {
    return Intl.message(
      'Age',
      name: 'formFieldAge',
      desc: 'Age',
      args: [],
    );
  }

  /// `Gender`
  String get formFieldGender {
    return Intl.message(
      'Gender',
      name: 'formFieldGender',
      desc: 'Gender',
      args: [],
    );
  }

  /// `State`
  String get formFieldState {
    return Intl.message(
      'State',
      name: 'formFieldState',
      desc: 'State',
      args: [],
    );
  }

  /// `Address`
  String get formFieldAddress {
    return Intl.message(
      'Address',
      name: 'formFieldAddress',
      desc: 'Address',
      args: [],
    );
  }

  /// `City`
  String get formFieldCity {
    return Intl.message(
      'City',
      name: 'formFieldCity',
      desc: 'City',
      args: [],
    );
  }

  /// `Zip Code`
  String get formFieldZipCode {
    return Intl.message(
      'Zip Code',
      name: 'formFieldZipCode',
      desc: 'Zip Code',
      args: [],
    );
  }

  /// `Notes`
  String get formFieldNotes {
    return Intl.message(
      'Notes',
      name: 'formFieldNotes',
      desc: 'Notes',
      args: [],
    );
  }

  /// `Theme Color`
  String get pageSettingsThemeColor {
    return Intl.message(
      'Theme Color',
      name: 'pageSettingsThemeColor',
      desc: 'Theme Color',
      args: [],
    );
  }

  /// `Light Theme`
  String get pageSettingsLightTheme {
    return Intl.message(
      'Light Theme',
      name: 'pageSettingsLightTheme',
      desc: 'Light Theme',
      args: [],
    );
  }

  /// `Dark Theme`
  String get pageSettingsDarkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'pageSettingsDarkTheme',
      desc: 'Dark Theme',
      args: [],
    );
  }

  /// `Acces Path`
  String get pageSettingsAccesPath {
    return Intl.message(
      'Acces Path',
      name: 'pageSettingsAccesPath',
      desc: 'Acces Path',
      args: [],
    );
  }

  /// `PDF Save Path`
  String get pageSettingsSavePathPDF {
    return Intl.message(
      'PDF Save Path',
      name: 'pageSettingsSavePathPDF',
      desc: 'Acces Path',
      args: [],
    );
  }

  /// `API Address Path`
  String get pageSettingsAccesPathAPI {
    return Intl.message(
      'API Address Path',
      name: 'pageSettingsAccesPathAPI',
      desc: 'API Address Path',
      args: [],
    );
  }

  /// `Unlock`
  String get pageSettingsAccesPathAPIUnlock {
    return Intl.message(
      'Unlock',
      name: 'pageSettingsAccesPathAPIUnlock',
      desc: 'Unlock',
      args: [],
    );
  }

  /// `Lock`
  String get pageSettingsAccesPathAPILock {
    return Intl.message(
      'Lock',
      name: 'pageSettingsAccesPathAPILock',
      desc: 'Lock',
      args: [],
    );
  }

  /// `Language`
  String get pageSettingsLanguage {
    return Intl.message(
      'Language',
      name: 'pageSettingsLanguage',
      desc: 'Language',
      args: [],
    );
  }

  /// `English`
  String get pageSettingsLocaleEN {
    return Intl.message(
      'English',
      name: 'pageSettingsLocaleEN',
      desc: 'English',
      args: [],
    );
  }

  /// `French`
  String get pageSettingsLocaleFR {
    return Intl.message(
      'French',
      name: 'pageSettingsLocaleFR',
      desc: 'French',
      args: [],
    );
  }

  /// `Japanese`
  String get pageSettingsLocaleJA {
    return Intl.message(
      'Japanese',
      name: 'pageSettingsLocaleJA',
      desc: 'Japanese',
      args: [],
    );
  }

  /// `PDF Generated`
  String get pdfGenerated {
    return Intl.message(
      'PDF Generated',
      name: 'pdfGenerated',
      desc: 'PDF Generated',
      args: [],
    );
  }

  /// `PDF has been saved to {path}`
  String pdfSavedTo(Object path) {
    return Intl.message(
      'PDF has been saved to $path',
      name: 'pdfSavedTo',
      desc: 'PDF has been saved to',
      args: [path],
    );
  }

  /// `OK`
  String get pdfOK {
    return Intl.message(
      'OK',
      name: 'pdfOK',
      desc: 'OK',
      args: [],
    );
  }

  /// `Cancel`
  String get pdfCancel {
    return Intl.message(
      'Cancel',
      name: 'pdfCancel',
      desc: 'Cancel',
      args: [],
    );
  }

  /// `Select a group`
  String get pdfSelectGroup {
    return Intl.message(
      'Select a group',
      name: 'pdfSelectGroup',
      desc: 'Select a group',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I10n> load(Locale locale) => I10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
