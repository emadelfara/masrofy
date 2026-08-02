/// Utility class responsible for formatting chart numbers.
///
/// Converts large numbers into shorter readable formats
/// for displaying inside charts and statistics.
abstract final class ChartNumberFormatter {
  ChartNumberFormatter._();

  // ============================================================
  // Number Formatting
  // ============================================================

  static String format(double value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    }

    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }

    return value.toStringAsFixed(0);
  }
}