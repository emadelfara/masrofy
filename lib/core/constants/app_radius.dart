// -----------------------------------------------------------------------------
// Border Radius Configuration
// -----------------------------------------------------------------------------

/// Standard border radius values used across the application.
///
/// Avoid using BorderRadius.circular() with random values
/// directly inside widgets.
abstract final class AppRadius {
  AppRadius._();

  // ---------------------------------------------------------------------------
  // Standard Radius Values
  // ---------------------------------------------------------------------------

  /// Small radius (8).
  static const double sm = 8.0;

  /// Medium radius (12).
  static const double md = 12.0;

  /// Large radius (16).
  static const double lg = 16.0;

  /// Extra large radius (24).
  static const double xl = 24.0;

  /// Full rounded radius.
  static const double full = 999.0;
}