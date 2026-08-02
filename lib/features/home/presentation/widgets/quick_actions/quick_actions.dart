// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_spacing.dart';

import 'quick_action_card.dart';
import 'quick_actions_items.dart';

// ============================================================
// Quick Actions
// ============================================================

class QuickActions extends StatelessWidget {
  const QuickActions({
    super.key,
  });

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = AppSpacing.md;

        final itemWidth = quickActions.length == 1
            ? constraints.maxWidth
            : (constraints.maxWidth - spacing) / 2;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: quickActions
              .map(
                (action) => SizedBox(
                  width: itemWidth,
                  child: QuickActionCard(
                    action: action,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}