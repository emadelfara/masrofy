// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/providers/transaction_provider.dart';

import 'section_header.dart';
import 'transaction_card.dart';

// ============================================================
// Recent Transactions Section
// ============================================================

class RecentTransactionsSection extends ConsumerWidget {
  const RecentTransactionsSection({
    super.key,
    required this.onSeeAllPressed,
  });

  // ============================================================
  // Properties
  // ============================================================

  final VoidCallback onSeeAllPressed;

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionProvider);

    return Column(
      children: [
        // ============================================================
        // Section Header
        // ============================================================

        SectionHeader(
          title: 'آخر المعاملات',
          onSeeAllPressed: onSeeAllPressed,
        ),

        const SizedBox(
          height: AppSpacing.md,
        ),

        // ============================================================
        // Transactions State
        // ============================================================

        transactionsAsync.when(
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: CircularProgressIndicator(),
            ),
          ),

          error: (_, _) => const Padding(
            padding: EdgeInsets.all(24),
            child: Text('حدث خطأ أثناء تحميل المعاملات'),
          ),

          data: (transactions) {
            if (transactions.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(24),
                child: Text('لا توجد معاملات'),
              );
            }

            final latest = transactions.reversed.take(5).toList();

            return Column(
              children: latest.map((transaction) {
                return TransactionCard(
                  title: transaction.title,
                  category: transaction.category.name,
                  amount: transaction.amount,
                  date:
                      '${transaction.date.day}/${transaction.date.month}',
                  icon: transaction.category.icon,
                  iconColor: transaction.category.color,
                  isIncome: transaction.isIncome,
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}