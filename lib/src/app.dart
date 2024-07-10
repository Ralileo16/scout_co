import 'package:flutter/material.dart';
import 'package:scout_co/src/utils/navigation_drawer_custom.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 33, 150, 243),
          brightness: Brightness.dark,
        ),
      ),
      home: const NavigationDrawerCustom(),
    );
  }
}
