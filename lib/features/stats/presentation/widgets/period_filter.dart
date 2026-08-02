// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_spacing.dart';

// ==========================
// Class
// ==========================

class PeriodFilter extends StatelessWidget {
  const PeriodFilter({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;

  final ValueChanged<int> onSelected;

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ==========================
        // Weekly Filter
        // ==========================

        Expanded(
          child: _PeriodButton(
            label: 'الأسبوع',
            selected: selectedIndex == 0,
            onTap: () => onSelected(0),
          ),
        ),

        const SizedBox(
          width: AppSpacing.sm,
        ),

        // ==========================
        // Monthly Filter
        // ==========================

        Expanded(
          child: _PeriodButton(
            label: 'الشهر',
            selected: selectedIndex == 1,
            onTap: () => onSelected(1),
          ),
        ),

        const SizedBox(
          width: AppSpacing.sm,
        ),

        // ==========================
        // Yearly Filter
        // ==========================

        Expanded(
          child: _PeriodButton(
            label: 'السنة',
            selected: selectedIndex == 2,
            onTap: () => onSelected(2),
          ),
        ),
      ],
    );
  }
}

// ==========================
// Private Widget
// ==========================

class _PeriodButton extends StatelessWidget {
  const _PeriodButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;

  final bool selected;

  final VoidCallback onTap;

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(100),

      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 220,
        ),

        curve: Curves.easeInOut,

        alignment: Alignment.center,

        padding: const EdgeInsets.symmetric(
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