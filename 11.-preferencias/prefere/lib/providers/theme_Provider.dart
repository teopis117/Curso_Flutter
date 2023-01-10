import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData temaactual;

  ThemeProvider({required bool isDarkmode})
      : temaactual = isDarkmode ? ThemeData.dark() : ThemeData.light();

  setKightMode() {
    temaactual = ThemeData.light();
    notifyListeners();
  }

  setDarkMode() {
    temaactual = ThemeData.dark();
    notifyListeners();
  }
}
