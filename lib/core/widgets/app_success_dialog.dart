// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import '../constants/app_radius.dart';
import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';

// ============================================================
// App Success Dialog
// ============================================================

/// A reusable success message dialog with animation.
class AppSuccessDialog extends StatelessWidget {
  const AppSuccessDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onPressed,
    this.buttonText = 'حسنًا',
  });

  // ============================================================
  // Properties
  // ============================================================

  final String title;

  final String message;

  final String buttonText;

  final VoidCallback onPressed;

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
      child: TweenAnimationBuilder<double>(
        duration: const Duration(
          milliseconds: 250,
        ),
        tween: Tween(
          begin: 0.9,
          end: 1.0,
        ),
        curve: Curves.easeOutBack,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Opacity(
              opacity: value.clamp(
                0.0,
                1.0,
              ),
              child: child,
            ),
          );
        },
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
                Icons.check_circle_rounded,
                size: 72,
                color: Colors.green,
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

              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  onPressed: onPressed,
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}