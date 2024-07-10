import 'package:flutter/material.dart';

class NavDestination {
  const NavDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<NavDestination> destinations = <NavDestination>[
  NavDestination(
      'Scouts', Icon(Icons.people_alt_outlined), Icon(Icons.people_alt)),
  NavDestination(
      'Inscriptions', Icon(Icons.article_outlined), Icon(Icons.article)),
  NavDestination(
      'Paramètres', Icon(Icons.settings_outlined), Icon(Icons.settings)),
];
