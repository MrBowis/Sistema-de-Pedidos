import 'package:flutter/material.dart';

class AppThemes {
  static final BorderRadius _borderRadius = BorderRadius.circular(16.0);
  static const Color _green = Color(0xFF43A047);

  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _green,
    colorScheme: ColorScheme.light(primary: _green, secondary: _green),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: _green, width: 2),
        borderRadius: _borderRadius,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: _green, width: 2),
        borderRadius: _borderRadius,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: _green, width: 2.5),
        borderRadius: _borderRadius,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    ),
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      elevation: 4,
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      buttonColor: _green,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        backgroundColor: _green,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        side: BorderSide(color: _green),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        foregroundColor: _green,
      ),
    ),
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _green,
    colorScheme: ColorScheme.dark(primary: _green, secondary: _green),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: _green, width: 2),
        borderRadius: _borderRadius,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: _green, width: 2),
        borderRadius: _borderRadius,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: _green, width: 2.5),
        borderRadius: _borderRadius,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    ),
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      elevation: 4,
      color: Colors.grey[900],
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      buttonColor: _green,
      textTheme: ButtonTextTheme.primary,
      colorScheme: ColorScheme.dark(
        primary: _green,
        secondary: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        backgroundColor: _green,
        foregroundColor: Colors.white,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        side: BorderSide(color: _green),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        foregroundColor: _green,
      ),
    ),
  );
}
