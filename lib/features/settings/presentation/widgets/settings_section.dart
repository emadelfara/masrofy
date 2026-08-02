// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// ==========================
// Class
// ==========================

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,
          style: AppTextStyles.textTheme.titleLarge?.copyWith(
            color: AppDarkColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: AppSpacing.md,
        ),

        Container(
          decoration: BoxDecoration(
            color: AppDarkColors.surface,
            borderRadius: BorderRadius.circular(
              AppRadius.lg,
            ),

            border: Border.all(
              color: AppDarkColors.border,
            ),
          ),

          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}