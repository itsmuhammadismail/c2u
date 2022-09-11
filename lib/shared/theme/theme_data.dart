import 'package:c2u/resources/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: kPrimaryColor,
      colorScheme: const ColorScheme.light(
        primary: kPrimaryColor,
      ),
      scaffoldBackgroundColor: kScaffoldColor,
      fontFamily: 'Ubuntu',
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
