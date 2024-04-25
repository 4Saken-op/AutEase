import 'package:autease/src/features/social/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData? appTheme() {
    return ThemeData(
      buttonTheme: buttonTheme(),
      iconButtonTheme: iconButtonTheme(),
      appBarTheme: appBarTheme(),
    );
  }

  // AppBar theme
  static AppBarTheme? appBarTheme() {
    return const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.blackColor,
      ),
    );
  }

  // Button theme
  static ButtonThemeData? buttonTheme() {
    return const ButtonThemeData(
      buttonColor: Color.fromARGB(255, 239, 161, 187),
    );
  }

  // Icon Button Theme
  static IconButtonThemeData? iconButtonTheme() {
    return const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 242, 147, 178),
        ),
        backgroundColor: MaterialStatePropertyAll(
          Colors.transparent,
        ),
      ),
    );
  }
}
