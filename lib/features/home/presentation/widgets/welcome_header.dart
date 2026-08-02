// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';
import 'package:masrofy/core/utils/greeting_utils.dart';

// ============================================================
// Welcome Header
// ============================================================

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({
    super.key,
    required this.username,
  });

  // ============================================================
  // Properties
  // ============================================================

  final String username;

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ============================================================
        // Welcome Message
        // ============================================================

        Text(
          '👋 أهلاً بك، $username',
          style: AppTextStyles.textTheme.titleLarge?.copyWith(
            color: AppDarkColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: AppSpacing.sm,
        ),

        // ============================================================
        // Greeting Message
        // ============================================================

        Text(
          GreetingUtils.getGreeting(),
          style: AppTextStyles.textTheme.bodyMedium?.copyWith(
            color: AppDarkColors.textSecondary,
          ),
        ),
      ],
    );
  }
}