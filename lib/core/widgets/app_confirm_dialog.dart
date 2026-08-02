// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import '../constants/app_radius.dart';
import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';

// ============================================================
// App Confirm Dialog
// ============================================================

/// A reusable confirmation dialog for destructive actions.
class AppConfirmDialog extends StatelessWidget {
  const AppConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmText = 'حذف',
    this.cancelText = 'إلغاء',
  });

  // ============================================================
  // Properties
  // ============================================================

  final String title;

  final String message;

  final String confirmText;

  final String cancelText;

  // ============================================================
  // Build
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 28,
      ),
      child: Container(
        padding: const EdgeInsets.all(
          AppSpacing.xl,
        ),
        decoration: BoxDecoration(
          color: AppDarkColors.surface,
          borderRadius: BorderRadius.circular(
            AppRadius.xl,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              size: 72,
              color: Colors.orange,
            ),

            const SizedBox(
              height: AppSpacing.lg,
            ),

            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall,
            ),

            const SizedBox(
              height: AppSpacing.md,
            ),

            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge,
            ),

            const SizedBox(
              height: AppSpacing.xl,
            ),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text(cancelText),
                  ),
                ),

                const SizedBox(
                  width: AppSpacing.md,
                ),

                Expanded(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppDarkColors.expense,
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text(confirmText),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}