import 'package:flutter/material.dart';

import 'settings_service.dart';

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  late Color _themeColor;
  Color get themeColor => _themeColor;

  late String _pdfPath;
  String get pdfPath => _pdfPath;

  late String _apiPath;
  String get apiPath => _apiPath;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _themeColor = await _settingsService.themeColor();
    _pdfPath = await _settingsService.pdfPath();
    _apiPath = await _settingsService.apiPath();

    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;
    notifyListeners();

    await _settingsService.updateThemeMode(newThemeMode);
  }

  Future<void> updateThemeColor(Color? newThemeColor) async {
    if (newThemeColor == null) return;
    if (newThemeColor == _themeColor) return;

    _themeColor = newThemeColor;
    notifyListeners();

    await _settingsService.updateThemeColor(newThemeColor);
  }

  Future<void> updatePDFPath(String? newPDFPath) async {
    if (newPDFPath == null) return;
    if (newPDFPath == _pdfPath) return;

    _pdfPath = newPDFPath;
    notifyListeners();

    await _settingsService.updatePDFPath(newPDFPath);
  }

  Future<void> updateAPIPath(String? newAPIPath) async {
    if (newAPIPath == null) return;
    if (newAPIPath == _apiPath) return;

    _apiPath = newAPIPath;
    notifyListeners();

    await _settingsService.updateAPIPath(newAPIPath);
  }
}
