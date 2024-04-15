import 'package:flutter/material.dart';
import 'package:pet_care_app/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  IconData _iconData = Icons.nightlight_round;

  Image _image = Image.asset(
    'assets/logo.png',
    width: 60,
    height: 60,
    color: Colors.black,
  );

  ThemeData get themeData => _themeData;
  IconData get iconData => _iconData;
  Image get image => _image;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
      _iconData = Icons.sunny;
      _image = Image.asset(
        'assets/logo.png',
        width: 60,
        height: 60,
        color: Colors.white,
      );
    } else {
      themeData = lightMode;
      _iconData = Icons.nightlight_round;
      _image = Image.asset(
        'assets/logo.png',
        width: 60,
        height: 60,
        color: Colors.black,
      );
    }
  }
}
