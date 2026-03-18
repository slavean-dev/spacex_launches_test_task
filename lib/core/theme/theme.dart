import 'package:flutter/material.dart';

abstract class AppTheme {
  static final baseTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFFBAFC54),
    ),
    scaffoldBackgroundColor: const Color(0xFF000000),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        height: 1.3,
      ),
      titleMedium: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        height: 1,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFA5A5A5),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      ),
      bodySmall: TextStyle(
        color: Color(0xFFC5C5C5),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      ),
      labelLarge: TextStyle(
        color: Color(0xFFBAFC54),
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        height: 1,
      ),
    ),
  );
}
