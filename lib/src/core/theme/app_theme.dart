import 'package:flutter/material.dart';

class AppCustomTheme {
  static const _pColor = Color.fromARGB(255, 0, 0, 0);
  static const _sCOlor = Color.fromARGB(255, 252, 84, 28);
  static ThemeData light = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(backgroundColor: _pColor),
      primaryColor: _pColor,
      fontFamily: 'Jost',
      colorScheme: ColorScheme.fromSeed(
          seedColor: _pColor,
          brightness: Brightness.light,
          primary: _pColor,
          secondary: _sCOlor));
  static ThemeData dark = ThemeData.dark().copyWith(
      // useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: _pColor,
      appBarTheme: const AppBarTheme(backgroundColor: _pColor),
      // fontFamily: 'Jost',
      colorScheme: const ColorScheme.dark(
          primary: _pColor, secondary: _sCOlor, brightness: Brightness.dark));
}
