// ============================================================
// Top Category Model
// ============================================================

/// Represents a top spending category displayed
/// in the statistics screen.
class TopCategoryModel {
  const TopCategoryModel({
    required this.categoryId,
    required this.title,
    required this.amount,
    required this.progress,
  });

  // ============================================================
  // Properties
  // ============================================================

  /// Unique category identifier.
  final int categoryId;

  /// Category display name.
  final String title;

  /// Total amount spent in this category.
  final double amount;

  /// Category contribution to total expenses.
  ///
  /// Expected range: 0.0 → 1.0
  final double progress;
}