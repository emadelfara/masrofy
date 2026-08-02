// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// ==========================
// Class
// ==========================

class TransactionFormHeader extends StatelessWidget {
  const TransactionFormHeader({
    super.key,
  });

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),

          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppDarkColors.textPrimary,
          ),
        ),

        const SizedBox(
          width: 8,
        ),

        Expanded(
          child: Text(
            'إضافة معاملة',

            style: AppTextStyles.textTheme.headlineSmall?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppDarkColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}