import 'package:flutter/material.dart';
import 'package:countdown/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  bool _switchValue = false; // To hold the switch state
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get switchValue => _switchValue;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void updateSwitchValue(bool value) {
    _switchValue = value;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
