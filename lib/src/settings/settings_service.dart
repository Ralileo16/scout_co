import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  late final SharedPreferences prefs;

  late final Future<SharedPreferences> _prefsFuture;

  factory SettingsService() => _instance;
  static final SettingsService _instance =
      SettingsService._internalConstructor();

  SettingsService._internalConstructor() {
    _prefsFuture = SharedPreferences.getInstance();
  }

  Future<void> initialize() async {
    prefs = await _prefsFuture;
  }

  Future<ThemeMode> themeMode() async {
    await initialize();
    if (prefs.getString('themeMode') == null) {
      prefs.setString('themeMode', 'ThemeMode.dark');
    }
    return prefs.getString('themeMode') == 'ThemeMode.dark'
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    String key = 'themeMode';
    String value = theme.toString();
    await prefs.setString(key, value);
  }

  Future<Color> themeColor() async {
    return switch (prefs.getString('themeColor')) {
      'MaterialColor(primary value: Color(0xfff44336))' =>
        const Color(0xfff44336),
      'MaterialColor(primary value: Color(0xffe91e63))' =>
        const Color(0xffe91e63),
      'MaterialColor(primary value: Color(0xff9c27b0))' =>
        const Color(0xff9c27b0),
      'MaterialColor(primary value: Color(0xff673ab7))' =>
        const Color(0xff673ab7),
      'MaterialColor(primary value: Color(0xff3f51b5))' =>
        const Color(0xff3f51b5),
      'MaterialColor(primary value: Color(0xff2196f3))' =>
        const Color(0xff2196f3),
      'MaterialColor(primary value: Color(0xff03a9f4))' =>
        const Color(0xff03a9f4),
      'MaterialColor(primary value: Color(0xff00bcd4))' =>
        const Color(0xff00bcd4),
      'MaterialColor(primary value: Color(0xff009688))' =>
        const Color(0xff009688),
      'MaterialColor(primary value: Color(0xff4caf50))' =>
        const Color(0xff4caf50),
      'MaterialColor(primary value: Color(0xff8bc34a))' =>
        const Color(0xff8bc34a),
      'MaterialColor(primary value: Color(0xffcddc39))' =>
        const Color(0xffcddc39),
      'MaterialColor(primary value: Color(0xffffeb3b))' =>
        const Color(0xffffeb3b),
      'MaterialColor(primary value: Color(0xffffc107))' =>
        const Color(0xffffc107),
      'MaterialColor(primary value: Color(0xffff9800))' =>
        const Color(0xffff9800),
      'MaterialColor(primary value: Color(0xffff5722))' =>
        const Color(0xffff5722),
      'MaterialColor(primary value: Color(0xff795548))' =>
        const Color(0xff795548),
      'MaterialColor(primary value: Color(0xff9e9e9e))' =>
        const Color(0xff9e9e9e),
      'MaterialColor(primary value: Color(0xff607d8b))' =>
        const Color(0xff607d8b),
      'Color(0xff000000)' => const Color(0xff000000),
      String() => Colors.black,
      null => Colors.black,
    };
  }

  Future<void> updateThemeColor(Color color) async {
    String key = 'themeColor';
    String value = color.toString();
    await prefs.setString(key, value);
  }

  Future<String> pdfPath() async {
    return prefs.getString('pdfPath') ?? '';
  }

  Future<void> updatePDFPath(String pdfPath) async {
    String key = 'pdfPath';
    String value = pdfPath;
    await prefs.setString(key, value);
  }

  Future<String> apiPath() async {
    return prefs.getString('apiPath') ?? '';
  }

  Future<void> updateAPIPath(String apiPath) async {
    String key = 'apiPath';
    String value = apiPath;
    await prefs.setString(key, value);
  }

  Future<Locale> locale() async {
    return Locale(prefs.getString('locale') ?? 'fr');
  }

  Future<void> updateLocale(Locale locale) async {
    String key = 'locale';
    String value = locale.languageCode;
    await prefs.setString(key, value);
  }
}
