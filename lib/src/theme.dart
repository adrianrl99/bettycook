import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/constants.dart';
import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  static bool? _isDark;

  AppTheme() {
    if (settingsBox.containsKey(settingsBoxDarkModeKey))
      _isDark = settingsBox.get(settingsBoxDarkModeKey);
  }

  ThemeMode currentTheme() {
    return _isDark == null
        ? ThemeMode.system
        : _isDark == true
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  void switchTheme(BuildContext context) {
    if (_isDark == null)
      _isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;

    _isDark = !_isDark!;
    settingsBox.put(settingsBoxDarkModeKey, _isDark);
    notifyListeners();
  }
}
