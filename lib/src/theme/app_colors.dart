import 'package:flutter/material.dart';

abstract class AppColorsTheme {
  Map<int, Color> get primaryColors;

  Color get primaryColor;

  Color get secondaryColor;

  Color get disableColor;

  Color get lightColor;

  List<Color> get lightGradientColor;

  Color get accentColor;

  Color get textColor;

  Color get defaultColor;

  Color get shimmerBackground;

  Color get shimmerAnimated;

  MaterialColor get materialPrimaryColor;

  Brightness get brightness;

  AppBarTheme get appBarThem;
}
