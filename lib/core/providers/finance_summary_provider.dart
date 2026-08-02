// ============================================================
// Imports
// ============================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/finance_summary_model.dart';

import 'transaction_provider.dart';

// ============================================================
// Finance Summary Provider
// ============================================================

/// Provides a calculated financial summary based on
/// the current list of transactions.
final financeSummaryProvider =
    Provider<AsyncValue<FinanceSummaryModel>>((ref) {
      final transactionsAsync = ref.watch(transactionProvider);

      return transactionsAsync.whenData((transactions) {
        double income = 0;
        double expense = 0;

        for (final transaction in transactions) {
          if (transaction.isIncome) {
            income += transaction.amount;
          } else {
            expense += transaction.amount;
          }
        }

        return FinanceSummaryModel(
          totalIncome: income,
          totalExpense: expense,
        );
      });
    });