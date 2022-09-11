import 'package:flutter/material.dart';

// Colors
const kPrimaryColor = MaterialColor(
  0xFF24336A, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: Color(0xFF24336A), //10%
    100: Color(0xFF24336A), //20%
    200: Color(0xFF24336A), //30%
    300: Color(0xFF24336A), //40%
    400: Color(0xFF24336A), //50%
    500: Color(0xFF24336A), //60%
    600: Color(0xFF24336A), //70%
    700: Color(0xFF24336A), //80%
    800: Color(0xFF24336A), //90%
    900: Color(0xFF24336A), //100%
  },
);

const kAccentColor = Color(0xFFFECD07);

const kScaffoldColor = Color(0xFFFFF9DF);

const kGray100 = Color(0xFFF4F6F9);
const kGray200 = Color(0xFFEEEFF1);
const kGray500 = Color(0xFF9E9E9E);
const kDisabledColor = Color(0xFF232323);
const kTextFieldColor = Color(0xFFE1D9BA);
const kHintTextColor = Color(0xFF5A4800);
