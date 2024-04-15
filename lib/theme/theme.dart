import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    
  ),
  colorScheme: ColorScheme.light(
    background: Colors.blue.shade200,
  )
);

ThemeData darkMode = ThemeData(
brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade800,
  )
);
