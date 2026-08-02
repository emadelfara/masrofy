// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/models/transaction_model.dart';

import '../empty_transactions_state.dart';
import 'transaction_card.dart';

// ==========================
// Class
// ==========================

class TransactionsList extends StatelessWidget {
  const TransactionsList({
    super.key,
    required this.transactions,
    required this.onDelete,
    required this.onEdit,
  });

  // ==========================
  // Properties
  // ==========================

  final List<TransactionModel> transactions;

  final void Function(
    TransactionModel transaction,
  ) onDelete;

  final void Function(
    TransactionModel transaction,
  ) onEdit;

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    // ==========================
    // Empty State
    // ==========================

    if (transactions.isEmpty) {
      return const EmptyTransactionsState();
    }

    // ==========================
    // Transactions List
    // ==========================

    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),

      itemCount: transactions.length,

      itemBuilder: (context, index) {
        final transaction = transactions[index];

        return TransactionCard(
          transaction: transaction,

          onDelete: () {
            onDelete(transaction);
          },

          onEdit: () {
            onEdit(transaction);
          },
        );
      },
    );
  }
}