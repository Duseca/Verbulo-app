import 'package:flutter/material.dart';
import 'package:verbulo/theme/light_theme.dart';

class ThemeProvoder with ChangeNotifier {
  ThemeData _themedata = lightTheme;
  bool _isDarkMode = false; // Default value for isDarkMode

  bool get isDarkMode => _isDarkMode;
  ThemeData get themeData => _themedata;
  set themeData(ThemeData themeData) {
    _themedata = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themedata == lightTheme) {
      themeData = darkTheme;
      _isDarkMode = true; // Use = for assignment
      notifyListeners();
    } else {
      themeData = lightTheme;
      _isDarkMode = false; // Use = for assignment
      notifyListeners();
    }
  }
}

class ThemeUtils {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
