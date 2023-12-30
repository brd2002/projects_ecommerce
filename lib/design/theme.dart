import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightThemeData = ThemeData(
      primaryColor: Colors.teal,
      appBarTheme: AppBarTheme(color: Colors.teal),
      brightness: Brightness.light,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.teal),
           ),
      ));
}
