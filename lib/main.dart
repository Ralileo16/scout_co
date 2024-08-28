import 'package:flutter/material.dart';
import 'package:scout_co/src/model/children_dto_repository.dart';
import 'package:scout_co/src/settings/settings_controller.dart';
import 'package:scout_co/src/settings/settings_service.dart';
import 'src/app.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  WidgetsFlutterBinding.ensureInitialized();
  await ChildrenDtoRepository().initialize();
  runApp(MyApp(settingsController: settingsController));
}
