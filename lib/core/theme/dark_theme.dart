// -----------------------------------------------------------------------------
// Flutter Imports
// -----------------------------------------------------------------------------

import 'package:flutter/material.dart';

// -----------------------------------------------------------------------------
// Project Imports
// -----------------------------------------------------------------------------

import 'package:masrofy/core/constants/app_fonts.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// -----------------------------------------------------------------------------
// Dark Theme Configuration
// -----------------------------------------------------------------------------

abstract final class DarkTheme {
  DarkTheme._();

  // ---------------------------------------------------------------------------
  // Theme Data
  // ---------------------------------------------------------------------------

  static ThemeData get theme {
    const colorScheme = ColorScheme.dark(
      primary: AppDarkColors.primary,
      secondary: AppDarkColors.secondary,
      surface: AppDarkColors.surface,
      error: AppDarkColors.error,
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: AppFonts.cairo,
      brightness: Brightness.dark,

      colorScheme: colorScheme,

      scaffoldBackgroundColor: AppDarkColors.background,

      textTheme: TextTheme(
        headlineLarge: AppTextStyles.textTheme.headlineLarge?.copyWith(
          color: AppDarkColors.textPrimary,
        ),
        titleLarge: AppTextStyles.textTheme.titleLarge?.copyWith(
          color: AppDarkColors.textPrimary,
        ),
        bodyLarge: AppTextStyles.textTheme.bodyLarge?.copyWith(
          color: AppDarkColors.textPrimary,
        ),
        bodyMedium: AppTextStyles.textTheme.bodyMedium?.copyWith(
          color: AppDarkColors.textPrimary,
        ),
        bodySmall: AppTextStyles.textTheme.bodySmall?.copyWith(
          color: AppDarkColors.textSecondary,
        ),
        labelLarge: AppTextStyles.textTheme.labelLarge?.copyWith(
          color: AppDarkColors.white,
        ),
      ),
    );
  }
}