// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/formatters/currency_formatter.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// ==========================
// Class
// ==========================

class StatsBalanceCard extends StatelessWidget {
  const StatsBalanceCard({
    super.key,
    required this.currentBalance,
  });

  final double currentBalance;

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(
        AppSpacing.lg,
      ),

      decoration: BoxDecoration(
        color: AppDarkColors.surface,

        borderRadius: BorderRadius.circular(
          AppRadius.xl,
        ),

        border: Border.all(
          color: AppDarkColors.border,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.15,
            ),

            blurRadius: 20,

            offset: const Offset(
              0,
              8,
            ),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // ==========================
          // Card Header
          // ==========================

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

          // ==========================
          // Balance Value
          // ==========================

          Text(
            CurrencyFormatter.format(currentBalance),

            style: AppTextStyles.textTheme.headlineLarge?.copyWith(
              color: AppDarkColors.textPrimary,

              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}