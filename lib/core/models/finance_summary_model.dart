// ============================================================
// Finance Summary Model
// ============================================================

/// Represents the overall financial summary.
///
/// It contains the total income, total expenses,
/// and provides the current balance.
class FinanceSummaryModel {
  const FinanceSummaryModel({
    required this.totalIncome,
    required this.totalExpense,
  });

  // ============================================================
  // Properties
  // ============================================================

  /// Total recorded income.
  final double totalIncome;

  /// Total recorded expenses.
  final double totalExpense;

  // ============================================================
  // Computed Properties
  // ============================================================

  /// Current balance.
  double get balance => totalIncome - totalExpense;
}