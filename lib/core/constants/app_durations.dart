// -----------------------------------------------------------------------------
// Animation Duration Configuration
// -----------------------------------------------------------------------------

abstract final class AppDurations {
  AppDurations._();

  // ---------------------------------------------------------------------------
  // Standard Durations
  // ---------------------------------------------------------------------------

  /// Fast animation duration (150 milliseconds).
  static const Duration fast = Duration(milliseconds: 150);

  /// Medium animation duration (300 milliseconds).
  static const Duration medium = Duration(milliseconds: 300);

  /// Slow animation duration (500 milliseconds).
  static const Duration slow = Duration(milliseconds: 500);
}