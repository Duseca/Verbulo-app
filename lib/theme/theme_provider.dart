import 'package:flutter/material.dart';
import 'package:verbulo/theme/light_theme.dart';
import 'package:verbulo/theme/user_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;
  ThemeData get themeData => _themeData;

  ThemeProvider() {
    _loadTheme(); // Load saved theme at initialization
  }

  Future<void> _loadTheme() async {
    final savedTheme = await UserPreferences.getTheme();
    if (savedTheme == 'dark') {
      _themeData = darkTheme;
      _isDarkMode = true;
    } else {
      _themeData = lightTheme;
      _isDarkMode = false;
    }
    notifyListeners();
  }

  void toggleTheme() async {
    if (_isDarkMode) {
      _themeData = lightTheme;
      _isDarkMode = false;
      await UserPreferences.setTheme('light');
    } else {
      _themeData = darkTheme;
      _isDarkMode = true;
      await UserPreferences.setTheme('dark');
    }
    notifyListeners();
  }
}

class ThemeUtils {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
