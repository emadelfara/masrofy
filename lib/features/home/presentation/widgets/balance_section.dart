// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/providers/finance_summary_provider.dart';

import 'balance_card.dart';
import 'summary_card.dart';

// ============================================================
// Balance Section
// ============================================================

class BalanceSection extends ConsumerWidget {
  const BalanceSection({
    super.key,
  });

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(financeSummaryProvider);

    return summaryAsync.when(
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, _) => const Center(
        child: Text('حدث خطأ أثناء تحميل البيانات'),
      ),
      data: (summary) {
        return Column(
          children: [
            // ============================================================
            // Balance Card
            // ============================================================

            BalanceCard(
              currentBalance: summary.balance,
            ),

            const SizedBox(
              height: AppSpacing.md,
            ),

            // ============================================================
            // Summary Cards
            // ============================================================

            Row(
              children: [
                Expanded(
                  child: SummaryCard(
                    title: 'الدخل',
                    amount: summary.totalIncome,
                    icon: Icons.trending_up_rounded,
                    iconColor: Colors.green,
                  ),
                ),

                const SizedBox(
                  width: AppSpacing.md,
                ),

                Expanded(
                  child: SummaryCard(
                    title: 'المصروفات',
                    amount: summary.totalExpense,
                    icon: Icons.trending_down_rounded,
                    iconColor: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}