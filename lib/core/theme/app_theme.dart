import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lighhtBackgroundColor,
    primaryColor: AppColors.lightPrimaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lighhtBackgroundColor,
      foregroundColor: AppColors.lightText,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightText, fontSize: 16),
      headlineLarge: TextStyle(
        color: AppColors.lightText,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.darkPrimary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkText,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkText, fontSize: 16),
      headlineMedium: TextStyle(
        color: AppColors.darkText,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
