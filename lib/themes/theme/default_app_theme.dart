import 'package:flutter/material.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';

final ThemeData defaultAppTheme = ThemeData(
  fontFamily: "Spectral",
  iconTheme: const IconThemeData(
    color: AppColors.lightSecondary,
  ),
  colorScheme: const ColorScheme.light(secondary: AppColors.secondaryColor),
  textTheme: const TextTheme(
    headline2: TextStyle(
      fontSize: 70,
      fontWeight: FontWeight.w300,
    ),
    headline4: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w400,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    subtitle1: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w400,
    ),
    button: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
);
