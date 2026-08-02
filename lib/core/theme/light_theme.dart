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
// Light Theme Configuration
// -----------------------------------------------------------------------------

abstract final class LightTheme {
  LightTheme._();

  // ---------------------------------------------------------------------------
  // Theme Data
  // ---------------------------------------------------------------------------

  static ThemeData get theme {
    const colorScheme = ColorScheme.light(
      primary: AppLightColors.primary,
      secondary: AppLightColors.secondary,
      surface: AppLightColors.surface,
      error: AppLightColors.error,
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: AppFonts.cairo,
      brightness: Brightness.light,

      colorScheme: colorScheme,

      scaffoldBackgroundColor: AppLightColors.background,

      textTheme: TextTheme(
        headlineLarge: AppTextStyles.textTheme.headlineLarge?.copyWith(
          color: AppLightColors.textPrimary,
        ),
        titleLarge: AppTextStyles.textTheme.titleLarge?.copyWith(
          color: AppLightColors.textPrimary,
        ),
        bodyLarge: AppTextStyles.textTheme.bodyLarge?.copyWith(
          color: AppLightColors.textPrimary,
        ),
        bodyMedium: AppTextStyles.textTheme.bodyMedium?.copyWith(
          color: AppLightColors.textPrimary,
        ),
        bodySmall: AppTextStyles.textTheme.bodySmall?.copyWith(
          color: AppLightColors.textSecondary,
        ),
        labelLarge: AppTextStyles.textTheme.labelLarge?.copyWith(
          color: AppLightColors.textPrimary,
        ),
      ),
    );
  }
}