// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// ============================================================
// Section Header
// ============================================================

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.onSeeAllPressed,
  });

  // ============================================================
  // Properties
  // ============================================================

  final String title;

  final VoidCallback onSeeAllPressed;

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.textTheme.titleMedium?.copyWith(
            color: AppDarkColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Spacer(),

        TextButton(
          onPressed: onSeeAllPressed,
          child: const Text('عرض الكل'),
        ),
      ],
    );
  }
}