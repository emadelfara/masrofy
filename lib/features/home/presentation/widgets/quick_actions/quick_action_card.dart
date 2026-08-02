// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_icon_sizes.dart';
import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';

import 'quick_action_model.dart';

// ============================================================
// Quick Action Card
// ============================================================

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({
    super.key,
    required this.action,
  });

  // ============================================================
  // Properties
  // ============================================================

  final QuickActionModel action;

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final colorScheme = theme.colorScheme;

    return Material(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        onTap: () => action.onTap(context),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ============================================================
              // Action Icon
              // ============================================================

              Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    action.icon,
                    size: AppIconSizes.lg,
                    color: colorScheme.primary,
                  ),

                  // ============================================================
                  // Add Badge
                  // ============================================================

                  if (action.showAddBadge)
                    Positioned(
                      top: -4,
                      right: -6,
                      child: Container(
                        width: AppSpacing.md,
                        height: AppSpacing.md,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          size: AppIconSizes.badge,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              // ============================================================
              // Action Title
              // ============================================================

              Text(
                action.title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}