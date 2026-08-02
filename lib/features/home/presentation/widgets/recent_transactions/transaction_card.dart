// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/formatters/currency_formatter.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// ============================================================
// Transaction Card
// ============================================================

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.icon,
    required this.iconColor,
    required this.isIncome,
  });

  // ============================================================
  // Properties
  // ============================================================

  final String title;
  final String category;

  final double amount;

  final String date;

  final IconData icon;
  final Color iconColor;

  final bool isIncome;

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: AppSpacing.md,
      ),

      padding: const EdgeInsets.all(
        AppSpacing.md,
      ),

      decoration: BoxDecoration(
        color: AppDarkColors.surface,
        borderRadius: BorderRadius.circular(
          AppRadius.lg,
        ),
        border: Border.all(
          color: AppDarkColors.border,
        ),
      ),

      child: Row(
        children: [
          // ============================================================
          // Transaction Icon
          // ============================================================

          CircleAvatar(
            radius: 22,
            backgroundColor: iconColor.withValues(alpha: 0.15),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),

          const SizedBox(
            width: AppSpacing.md,
          ),

          // ============================================================
          // Transaction Details
          // ============================================================

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.textTheme.bodyLarge?.copyWith(
                    color: AppDarkColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(
                  height: 2,
                ),

                Text(
                  category,
                  style: AppTextStyles.textTheme.bodySmall?.copyWith(
                    color: AppDarkColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // ============================================================
          // Amount & Date
          // ============================================================

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isIncome ? '+' : '-'} ${CurrencyFormatter.format(amount)}',
                style: AppTextStyles.textTheme.bodyLarge?.copyWith(
                  color: iconColor,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 2,
              ),

              Text(
                date,
                style: AppTextStyles.textTheme.bodySmall?.copyWith(
                  color: AppDarkColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}