// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// ==========================
// Main Widget
// ==========================

class TransactionTypeSelector extends StatelessWidget {
  const TransactionTypeSelector({
    super.key,
    required this.isIncome,
    required this.onChanged,
  });

  // ==========================
  // Properties
  // ==========================

  final bool isIncome;

  final ValueChanged<bool> onChanged;

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نوع العملية',
          style: AppTextStyles.textTheme.titleMedium?.copyWith(
            color: AppDarkColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        Row(
          children: [
            Expanded(
              child: _TypeCard(
                title: 'مصروفات',
                icon: Icons.arrow_upward_rounded,
                color: AppDarkColors.expense,
                selected: !isIncome,
                onTap: () => onChanged(false),
              ),
            ),

            const SizedBox(width: AppSpacing.md),

            Expanded(
              child: _TypeCard(
                title: 'دخل',
                icon: Icons.arrow_downward_rounded,
                color: AppDarkColors.income,
                selected: isIncome,
                onTap: () => onChanged(true),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ==========================
// Private Widget
// ==========================

class _TypeCard extends StatelessWidget {
  const _TypeCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  // ==========================
  // Properties
  // ==========================

  final String title;

  final IconData icon;

  final Color color;

  final bool selected;

  final VoidCallback onTap;

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppRadius.lg),

      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
        ),

        decoration: BoxDecoration(
          color: selected
              ? color.withValues(alpha: 0.15)
              : AppDarkColors.surface,

          borderRadius: BorderRadius.circular(AppRadius.lg),

          border: Border.all(
            color: selected
                ? color
                : AppDarkColors.border,

            width: selected ? 2 : 1,
          ),
        ),

        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 24,
            ),

            const SizedBox(
              height: AppSpacing.xs,
            ),

            Text(
              title,

              style: AppTextStyles.textTheme.titleSmall?.copyWith(
                color: AppDarkColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}