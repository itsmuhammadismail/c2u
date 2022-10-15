import 'package:c2u/resources/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: kPrimaryColor,
      canvasColor: Colors.transparent,
      colorScheme: const ColorScheme.light(
        primary: kPrimaryColor,
      ),
      scaffoldBackgroundColor: kScaffoldColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith(
            (states) => kPrimaryColor), //<-- SEE HERE
      ),
      fontFamily: 'Ubuntu',
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
