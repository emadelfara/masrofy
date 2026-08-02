// ============================================================
// Imports
// ============================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';

import '../mappers/category_mapper.dart';
import '../mappers/transaction_mapper.dart';

import '../models/transaction_model.dart';

import 'repository_providers.dart';

// ============================================================
// Transaction Notifier
// ============================================================

/// Manages transaction data and CRUD operations.
class TransactionNotifier extends AsyncNotifier<List<TransactionModel>> {
  @override
  Future<List<TransactionModel>> build() async {
    return _loadTransactions();
  }

  // ============================================================
  // Private Methods
  // ============================================================

  Future<List<TransactionModel>> _loadTransactions() async {
    final transactionRepository = ref.read(transactionRepositoryProvider);
    final categoryRepository = ref.read(categoryRepositoryProvider);

    final transactions = await transactionRepository.getAllTransactions();
    final categories = await categoryRepository.getAllCategories();

    return transactions.map((transaction) {
      final category = categories.firstWhere(
        (c) => c.id == transaction.categoryId,
      );

      return transaction.toModel(category.toModel());
    }).toList();
  }

  // ============================================================
  // Public Methods
  // ============================================================

  /// Reloads all transactions from the database.
  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(_loadTransactions);
  }

  /// Inserts a new transaction.
  Future<void> addTransaction(TransactionsCompanion transaction) async {
    await ref.read(
      transactionRepositoryProvider,
    ).insertTransaction(transaction);

    await refresh();
  }

  /// Updates an existing transaction.
  Future<void> updateTransaction(Transaction transaction) async {
    await ref.read(
      transactionRepositoryProvider,
    ).updateTransaction(transaction);

    await refresh();
  }

  /// Updates a transaction using form values.
  Future<void> updateTransactionFromCompanion({
    required int id,
    required TransactionsCompanion companion,
    required bool isIncome,
  }) async {
    final updated = Transaction(
      id: id,
      title: companion.title.value,
      amount: companion.amount.value,
      categoryId: companion.categoryId.value,
      date: companion.date.value,
      isIncome: isIncome,
      notes: companion.notes.present ? companion.notes.value : null,
    );

    await updateTransaction(updated);
  }

  /// Deletes a transaction.
  Future<void> deleteTransaction(int id) async {
    await ref.read(transactionRepositoryProvider).deleteTransaction(id);

    await refresh();
  }
}

// ============================================================
// Provider
// ============================================================

/// Provides transaction state throughout the application.
final transactionProvider =
    AsyncNotifierProvider<TransactionNotifier, List<TransactionModel>>(
      TransactionNotifier.new,
    );