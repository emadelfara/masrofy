// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';

// ==========================
// Class
// ==========================

class TransactionsSearchBar extends StatelessWidget {
  const TransactionsSearchBar({
    super.key,
    required this.onChanged,
  });

  // ==========================
  // Properties
  // ==========================

  final ValueChanged<String> onChanged;

  // ==========================
  // Build UI
  // ==========================

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,

      decoration: InputDecoration(
        hintText: 'ابحث عن معاملة...',

        prefixIcon: const Icon(
          Icons.search,
        ),

        filled: true,

        fillColor: Theme.of(context).colorScheme.surface,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.lg,
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}