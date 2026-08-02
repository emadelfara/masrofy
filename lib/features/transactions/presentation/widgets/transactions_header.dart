// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import '../models/transaction_sort.dart';

// ==========================
// Class
// ==========================

class TransactionsHeader extends StatelessWidget {
  const TransactionsHeader({
    super.key,
    required this.title,
    required this.count,
    required this.sort,
    required this.onSortSelected,
  });

  // ==========================
  // Properties
  // ==========================

  final String title;

  final int count;

  final TransactionSort sort;

  final ValueChanged<TransactionSort> onSortSelected;

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        8,
        16,
        12,
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // ==========================
          // Header Information
          // ==========================

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),

                const SizedBox(
                  height: 4,
                ),

                Text(
                  '$count معاملة',

                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium,
                ),
              ],
            ),
          ),

          // ==========================
          // Sort Menu
          // ==========================

          PopupMenuButton<TransactionSort>(
            tooltip: 'ترتيب',

            initialValue: sort,

            onSelected: onSortSelected,

            icon: const Icon(
              Icons.sort_rounded,
            ),

            itemBuilder: (context) => const [
              PopupMenuItem(
                value: TransactionSort.newest,

                child: Text(
                  'الأحدث أولًا',
                ),
              ),

              PopupMenuItem(
                value: TransactionSort.oldest,

                child: Text(
                  'الأقدم أولًا',
                ),
              ),

              PopupMenuItem(
                value: TransactionSort.highestAmount,

                child: Text(
                  'الأعلى مبلغًا',
                ),
              ),

              PopupMenuItem(
                value: TransactionSort.lowestAmount,

                child: Text(
                  'الأقل مبلغًا',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}