// ============================================================
// Imports
// ============================================================

import '../database/app_database.dart';

// ============================================================
// Transaction Repository
// ============================================================

/// Handles transaction-related database operations.
class TransactionRepository {
  TransactionRepository(this._database);

  final AppDatabase _database;

  // ============================================================
  // CRUD Operations
  // ============================================================

  /// Returns all transactions.
  Future<List<Transaction>> getAllTransactions() {
    return _database.getAllTransactions();
  }

  /// Inserts a new transaction.
  Future<int> insertTransaction(
    TransactionsCompanion transaction,
  ) {
    return _database.insertTransaction(transaction);
  }

  /// Updates an existing transaction.
  Future<bool> updateTransaction(
    Transaction transaction,
  ) {
    return _database.updateTransaction(transaction);
  }

  /// Deletes a transaction by its id.
  Future<int> deleteTransaction(
    int id,
  ) {
    return _database.deleteTransaction(id);
  }
}