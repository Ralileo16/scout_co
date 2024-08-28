import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:scout_co/core/localization/generated/l10n.dart';
import 'package:scout_co/src/settings/settings_controller.dart';
import 'package:scout_co/src/utils/navigation_drawer_custom.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          locale: settingsController.locale,
          localizationsDelegates: const [
            I10n.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: I10n.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          themeMode: settingsController.themeMode,
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: settingsController.themeColor,
              brightness: Brightness.dark,
            ),
          ),
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: settingsController.themeColor,
              brightness: Brightness.light,
            ),
          ),
          home: NavigationDrawerCustom(settingsController: settingsController),
        );
      },
    );
  }
}
