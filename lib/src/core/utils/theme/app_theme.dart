import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(
          color: AppColors.blue,
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
        ),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.darkBlue,
    )
  );

  static const ThemeMode kMode = ThemeMode.dark;
}
