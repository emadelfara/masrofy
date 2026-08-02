// ============================================================
// Chart Bar Model
// ============================================================

/// Represents a single bar in the statistics chart.
class ChartBarModel {
  const ChartBarModel({
    required this.label,
    required this.amount,
  });

  // ============================================================
  // Properties
  // ============================================================

  /// Label displayed below the chart bar.
  final String label;

  /// Amount represented by the chart bar.
  final double amount;
}