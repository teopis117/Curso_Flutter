import 'package:flutter/material.dart' show IconData, Widget;

class MenuOption {
  //las variables final deben de ser inicializadas en el constructor
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  MenuOption(
      {required this.route,
      required this.icon,
      required this.name,
      required this.screen});
}
