// ============================================================
// Imports
// ============================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/top_category_model.dart';

import 'transaction_provider.dart';

// ============================================================
// Top Categories Provider
// ============================================================

/// Provides the top spending categories based on transactions.
final topCategoriesProvider =
    Provider<AsyncValue<List<TopCategoryModel>>>((ref) {
      final transactionsAsync = ref.watch(transactionProvider);

      return transactionsAsync.whenData((transactions) {
        final expenses = transactions.where((t) => !t.isIncome).toList();

        if (expenses.isEmpty) {
          return [];
        }

        final Map<String, double> totals = {};

        for (final transaction in expenses) {
          totals.update(
            transaction.category.name,
            (value) => value + transaction.amount,
            ifAbsent: () => transaction.amount,
          );
        }

        final totalExpense = totals.values.fold<double>(
          0,
          (sum, value) => sum + value,
        );

        final result = totals.entries.map((entry) {
          return TopCategoryModel(
            categoryId: 0,
            title: entry.key,
            amount: entry.value,
            progress: totalExpense == 0
                ? 0
                : entry.value / totalExpense,
          );
        }).toList();

        result.sort((a, b) => b.amount.compareTo(a.amount));

        return result.take(3).toList();
      });
    });