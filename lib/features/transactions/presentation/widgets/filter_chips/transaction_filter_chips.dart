// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_spacing.dart';

// ==========================
// Class
// ==========================

class TransactionFilterChips extends StatelessWidget {
  const TransactionFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onSelected,
  });

  // ==========================
  // Properties
  // ==========================

  final int selectedFilter;

  final ValueChanged<int> onSelected;

  // ==========================
  // Build UI
  // ==========================

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _FilterButton(
            label: 'الكل',
            selected: selectedFilter == 0,
            onTap: () => onSelected(0),
          ),

          const SizedBox(
            width: AppSpacing.sm,
          ),

          _FilterButton(
            label: 'دخل',
            selected: selectedFilter == 1,
            onTap: () => onSelected(1),
          ),

          const SizedBox(
            width: AppSpacing.sm,
          ),

          _FilterButton(
            label: 'مصروفات',
            selected: selectedFilter == 2,
            onTap: () => onSelected(2),
          ),
        ],
      ),
    );
  }
}

// ==========================
// Private Widget
// ==========================

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  // ==========================
  // Properties
  // ==========================

  final String label;

  final bool selected;

  final VoidCallback onTap;

  // ==========================
  // Build UI
  // ==========================

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,

        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 12,
        ),

        decoration: BoxDecoration(
          color: selected
              ? colorScheme.primary
              : colorScheme.surface,

          borderRadius: BorderRadius.circular(100),
        ),

        child: Text(
          label,
          style: TextStyle(
            color: selected
                ? Colors.white
                : colorScheme.onSurface,

            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}