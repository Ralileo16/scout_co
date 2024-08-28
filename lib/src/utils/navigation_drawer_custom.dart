import 'package:flutter/material.dart';

import 'package:scout_co/src/pages/children_view.dart';
import 'package:scout_co/src/pages/inscription_view.dart';
import 'package:scout_co/src/pages/settings_view.dart';
import 'package:scout_co/src/settings/settings_controller.dart';
import 'package:scout_co/src/utils/nav_destination.dart';

class NavigationDrawerCustom extends StatefulWidget {
  const NavigationDrawerCustom({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  State<NavigationDrawerCustom> createState() => NavigationDrawerCustomState();
}

class NavigationDrawerCustomState extends State<NavigationDrawerCustom> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const ChildrenViewPage(),
      const InscriptionViewPage(),
      SettingsView(controller: widget.settingsController)
    ];
  }

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
      Navigator.of(context).pop();
    });
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[screenIndex],
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Scouts Chaudière-Ouest"),
      ),
      drawer: NavigationDrawer(
        onDestinationSelected: handleScreenChanged,
        selectedIndex: screenIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Navigation',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          ...destinations.map(
            (NavDestination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
