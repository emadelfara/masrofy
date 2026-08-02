// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// ==========================
// Class
// ==========================

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          'الإعدادات',
          style: AppTextStyles.textTheme.headlineMedium?.copyWith(
            color: AppDarkColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: AppSpacing.xs,
        ),

        Text(
          'خصص تطبيق مصروفي بالطريقة التي تناسبك.',
          style: AppTextStyles.textTheme.bodyMedium?.copyWith(
            color: AppDarkColors.textSecondary,
          ),
        ),
      ],
    );
  }
}