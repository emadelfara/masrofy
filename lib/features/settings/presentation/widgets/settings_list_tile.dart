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

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        AppRadius.md,
      ),

      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),

        child: Row(
          children: [
            Icon(
              icon,
              color: AppDarkColors.primary,
            ),

            const SizedBox(
              width: AppSpacing.md,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,
                    style: AppTextStyles.textTheme.titleMedium?.copyWith(
                      color: AppDarkColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  if (subtitle != null) ...[
                    const SizedBox(
                      height: AppSpacing.xs,
                    ),

                    Text(
                      subtitle!,
                      style: AppTextStyles.textTheme.bodySmall?.copyWith(
                        color: AppDarkColors.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            trailing ??
                (onTap != null
                    ? const Icon(
                        Icons.chevron_right_rounded,
                        size: 22,
                        color: AppDarkColors.textSecondary,
                      )
                    : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}