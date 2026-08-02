// -----------------------------------------------------------------------------
// Flutter Imports
// -----------------------------------------------------------------------------

import 'package:flutter/material.dart';

// -----------------------------------------------------------------------------
// Light Theme Colors
// -----------------------------------------------------------------------------

/// Color palette for the Masrofy light theme.
abstract final class AppLightColors {
  AppLightColors._();

  // ---------------------------------------------------------------------------
  // Base Colors
  // ---------------------------------------------------------------------------

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // ---------------------------------------------------------------------------
  // Brand Colors
  // ---------------------------------------------------------------------------

  static const Color primary = Color(0xFF10B981);
  static const Color primaryDark = Color(0xFF059669);
  static const Color secondary = Color(0xFF14B8A6);

  // ---------------------------------------------------------------------------
  // Background Colors
  // ---------------------------------------------------------------------------

  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);

  // ---------------------------------------------------------------------------
  // Text Colors
  // ---------------------------------------------------------------------------

  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);

  // ---------------------------------------------------------------------------
  // Border Colors
  // ---------------------------------------------------------------------------

  static const Color border = Color(0xFFE5E7EB);

  // ---------------------------------------------------------------------------
  // Status Colors
  // ---------------------------------------------------------------------------

  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // ---------------------------------------------------------------------------
  // Finance Colors
  // ---------------------------------------------------------------------------

  static const Color income = Color(0xFF22C55E);
  static const Color expense = Color(0xFFEF4444);
}

// -----------------------------------------------------------------------------
// Dark Theme Colors
// -----------------------------------------------------------------------------

/// Color palette for the Masrofy dark theme.
abstract final class AppDarkColors {
  AppDarkColors._();

  // ---------------------------------------------------------------------------
  // Base Colors
  // ---------------------------------------------------------------------------

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // ---------------------------------------------------------------------------
  // Brand Colors
  // ---------------------------------------------------------------------------

  static const Color primary = Color(0xFF10B981);
  static const Color primaryDark = Color(0xFF059669);
  static const Color secondary = Color(0xFF14B8A6);

  // ---------------------------------------------------------------------------
  // Background Colors
  // ---------------------------------------------------------------------------

  static const Color background = Color(0xFF0F172A);
  static const Color surface = Color(0xFF1E293B);

  // ---------------------------------------------------------------------------
  // Text Colors
  // ---------------------------------------------------------------------------

  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFFCBD5E1);

  // ---------------------------------------------------------------------------
  // Border Colors
  // ---------------------------------------------------------------------------

  static const Color border = Color(0xFF334155);

  // ---------------------------------------------------------------------------
  // Status Colors
  // ---------------------------------------------------------------------------

  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // ---------------------------------------------------------------------------
  // Finance Colors
  // ---------------------------------------------------------------------------

  static const Color income = Color(0xFF22C55E);
  static const Color expense = Color(0xFFEF4444);
}