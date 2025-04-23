import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _theme = ThemeMode.light;
  ThemeMode get themeMode => _theme;

  void toggleDarkMode(bool isDark) {
    _theme = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
