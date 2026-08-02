// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/theme/app_colors.dart';

// ==========================
// Class
// ==========================

class SaveTransactionButton extends StatelessWidget {
  const SaveTransactionButton({
    super.key,
    required this.onPressed,
  });

  // ==========================
  // Variables
  // ==========================

  final VoidCallback onPressed;

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,

      child: FilledButton.icon(
        onPressed: onPressed,

        icon: const Icon(
          Icons.save_rounded,
        ),

        label: const Text(
          'حفظ العملية',
        ),

        style: FilledButton.styleFrom(
          backgroundColor: AppDarkColors.primary,
          foregroundColor: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppRadius.lg,
            ),
          ),

          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.md,
          ),
        ),
      ),
    );
  }
}