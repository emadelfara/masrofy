// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// ============================================================
// Amount Field
// ============================================================

class AmountField extends StatelessWidget {
  const AmountField({
    super.key,
    required this.controller,
  });

  // ============================================================
  // Properties
  // ============================================================

  final TextEditingController controller;

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // ============================================================
        // Label
        // ============================================================

        Text(
          'المبلغ',
          style: AppTextStyles.textTheme.titleMedium?.copyWith(
            color: AppDarkColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: AppSpacing.md,
        ),

        // ============================================================
        // Amount Input
        // ============================================================

        TextFormField(
          controller: controller,

          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),

          style: AppTextStyles.textTheme.titleMedium?.copyWith(
            color: AppDarkColors.textPrimary,
          ),

          // ============================================================
          // Validation
          // ============================================================

          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'من فضلك أدخل المبلغ';
            }

            final amount = double.tryParse(
              value,
            );

            if (amount == null) {
              return 'أدخل مبلغًا صحيحًا';
            }

            if (amount <= 0) {
              return 'يجب أن يكون المبلغ أكبر من صفر';
            }

            return null;
          },

          // ============================================================
          // Decoration
          // ============================================================

          decoration: InputDecoration(
            hintText: 'أدخل المبلغ',

            prefixIcon: const Icon(
              Icons.payments_rounded,
            ),

            suffixText: 'ج.م',

            filled: true,

            fillColor: AppDarkColors.surface,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.lg,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.lg,
              ),
              borderSide: const BorderSide(
                color: AppDarkColors.border,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.lg,
              ),
              borderSide: const BorderSide(
                color: AppDarkColors.primary,
                width: 2,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.lg,
              ),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.lg,
              ),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}