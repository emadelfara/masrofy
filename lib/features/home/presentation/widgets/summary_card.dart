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
// Summary Card
// ============================================================

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.iconColor,
  });

  // ============================================================
  // Properties
  // ============================================================

  final String title;

  final double amount;

  final IconData icon;

  final Color iconColor;

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppDarkColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: AppDarkColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ============================================================
          // Card Header
          // ============================================================

          Row(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 20,
              ),

              const SizedBox(
                width: AppSpacing.xs,
              ),

              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.textTheme.bodyMedium?.copyWith(
                    color: AppDarkColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          // ============================================================
          // Amount
          // ============================================================

          Text(
            CurrencyFormatter.format(amount),
            style: AppTextStyles.textTheme.titleMedium?.copyWith(
              color: AppDarkColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}