// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/constants/finance_tips.dart';
import 'package:masrofy/core/formatters/currency_formatter.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// ============================================================
// Balance Card
// ============================================================

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
    required this.currentBalance,
  });

  // ============================================================
  // Properties
  // ============================================================

  final double currentBalance;

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppDarkColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(
            color: AppDarkColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ============================================================
            // Balance Header
            // ============================================================

            Row(
              children: [
                Icon(
                  Icons.account_balance_wallet_rounded,
                  color: AppDarkColors.primary,
                  size: 24,
                ),

                const SizedBox(
                  width: AppSpacing.sm,
                ),

                Text(
                  'الرصيد الحالي',
                  style: AppTextStyles.textTheme.bodyMedium?.copyWith(
                    color: AppDarkColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: AppSpacing.lg,
            ),

            // ============================================================
            // Current Balance
            // ============================================================

            Text(
              CurrencyFormatter.format(currentBalance),
              style: AppTextStyles.textTheme.headlineLarge?.copyWith(
                color: AppDarkColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            Divider(
              color: AppDarkColors.border,
            ),

            const SizedBox(
              height: AppSpacing.sm,
            ),

            // ============================================================
            // Finance Tip Header
            // ============================================================

            Row(
              children: [
                const Icon(
                  Icons.lightbulb_rounded,
                  color: AppDarkColors.warning,
                  size: 18,
                ),

                const SizedBox(
                  width: AppSpacing.xs,
                ),

                Text(
                  'نصيحة اليوم',
                  style: AppTextStyles.textTheme.bodySmall?.copyWith(
                    color: AppDarkColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: AppSpacing.xs,
            ),

            // ============================================================
            // Finance Tip
            // ============================================================

            Text(
              FinanceTips.getTodayTip(),
              style: AppTextStyles.textTheme.bodySmall?.copyWith(
                color: AppDarkColors.textPrimary,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}