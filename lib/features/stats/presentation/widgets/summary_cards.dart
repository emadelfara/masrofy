// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/providers/finance_summary_provider.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/features/home/presentation/widgets/summary_card.dart';

import 'stats_balance_card.dart';

// ==========================
// Class
// ==========================

class SummaryCards extends ConsumerWidget {
  const SummaryCards({
    super.key,
  });

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(
      financeSummaryProvider,
    );

    return summaryAsync.when(
      // ==========================
      // Loading State
      // ==========================

      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),

      // ==========================
      // Error State
      // ==========================

      error: (_, _) => const Center(
        child: Text(
          'حدث خطأ أثناء تحميل البيانات',
        ),
      ),

      // ==========================
      // Success State
      // ==========================

      data: (summary) {
        return Column(
          children: [
            // ==========================
            // Current Balance Card
            // ==========================

            StatsBalanceCard(
              currentBalance: summary.balance,
            ),

            const SizedBox(
              height: AppSpacing.lg,
            ),

            // ==========================
            // Income / Expense Cards
            // ==========================

            Row(
              children: [
                Expanded(
                  child: SummaryCard(
                    title: 'الدخل',

                    amount: summary.totalIncome,

                    icon: Icons.trending_up_rounded,

                    iconColor: AppDarkColors.success,
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

                    iconColor: AppDarkColors.error,
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