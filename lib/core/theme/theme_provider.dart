import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Default to system settings (follows browser/OS)
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  // Helper to check if we are currently in dark mode
  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      // Check system brightness if set to system
      return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  void toggleTheme(bool isOn) {
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // This triggers the UI rebuild
  }
}
