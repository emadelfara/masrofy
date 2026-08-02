// ============================================================
// Imports
// ============================================================

import '../database/app_database.dart';
import '../models/category_model.dart';
import '../models/transaction_model.dart';

// ============================================================
// Transaction Mapper
// ============================================================

/// Extension responsible for converting a database [Transaction]
/// into the application's [TransactionModel].
extension TransactionMapper on Transaction {
  // ============================================================
  // Database → Model
  // ============================================================

  TransactionModel toModel(CategoryModel category) {
    return TransactionModel(
      id: id,
      title: title,
      amount: amount,
      date: date,
      category: category,
      isIncome: isIncome,
      notes: notes,
    );
  }
}