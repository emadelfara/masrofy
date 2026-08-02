// ============================================================
// Imports
// ============================================================

import 'category_model.dart';

// ============================================================
// Transaction Model
// ============================================================

/// Represents a financial transaction.
///
/// A transaction can be either an income or an expense
/// and belongs to a specific category.
class TransactionModel {
  const TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.isIncome,
    this.notes,
  });

  // ============================================================
  // Properties
  // ============================================================

  /// Unique transaction identifier.
  final int id;

  /// Transaction title.
  final String title;

  /// Transaction amount.
  final double amount;

  /// Transaction date.
  final DateTime date;

  /// Associated category.
  final CategoryModel category;

  /// Indicates whether this transaction is an income.
  ///
  /// - `true` → Income
  /// - `false` → Expense
  final bool isIncome;

  /// Optional notes attached to the transaction.
  final String? notes;
}