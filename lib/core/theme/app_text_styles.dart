// -----------------------------------------------------------------------------
// Flutter Imports
// -----------------------------------------------------------------------------

import 'package:flutter/material.dart';

// -----------------------------------------------------------------------------
// Text Styles Configuration
// -----------------------------------------------------------------------------

abstract final class AppTextStyles {
  AppTextStyles._();

  // ---------------------------------------------------------------------------
  // Application Text Theme
  // ---------------------------------------------------------------------------

  static const TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),

    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),

    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),

    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),

    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),

    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),

    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),

    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),

    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),

    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),

    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),

    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  );
}