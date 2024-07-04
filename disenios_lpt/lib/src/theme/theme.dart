import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.light();

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3: //dark
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
    }
  }

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;

  ThemeData get currentTheme => _currentTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ColorScheme(
            primary: Colors.white,
            secondary: Color(0XFF48A0EB),
            error: Colors.red,
            background: Color(0XFF16202B),
            brightness: Brightness.dark,
            onPrimary: Colors.white,
            onSecondary: Color(0XFF48A0EB),
            onError: Colors.red,
            onBackground: Color(0XFF16202B),
            surface: Colors.white,
            onSurface: Colors.white,
          ),
          scaffoldBackgroundColor: Color(0XFF16202B),
          primaryColorLight: Colors.white,
          textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)));
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
