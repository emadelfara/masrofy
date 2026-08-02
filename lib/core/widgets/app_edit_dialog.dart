// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import '../constants/app_radius.dart';
import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';

// ============================================================
// App Edit Dialog
// ============================================================

/// A reusable dialog for editing data with a custom content widget.
class AppEditDialog extends StatelessWidget {
  const AppEditDialog({
    super.key,
    required this.title,
    required this.child,
    required this.onSave,
    this.saveText = 'حفظ',
    this.cancelText = 'إلغاء',
  });

  // ============================================================
  // Properties
  // ============================================================

  final String title;

  final Widget child;

  /// Called when save button is pressed.
  /// The dialog closes only if the operation succeeds.
  final Future<void> Function() onSave;

  final String saveText;

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
        horizontal: 24,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall,
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              child,

              const SizedBox(
                height: AppSpacing.xl,
              ),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(cancelText),
                    ),
                  ),

                  const SizedBox(
                    width: AppSpacing.md,
                  ),

                  Expanded(
                    child: FilledButton(
                      onPressed: () async {
                        await onSave();

                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(saveText),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}