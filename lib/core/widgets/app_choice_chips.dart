// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_spacing.dart';

// ============================================================
// App Choice Chips
// ============================================================

/// A reusable choice chip selector widget.
class AppChoiceChips<T> extends StatelessWidget {
  const AppChoiceChips({
    super.key,
    required this.values,
    required this.selectedValue,
    required this.labelBuilder,
    required this.onSelected,
    this.expand = false,
  });

  // ============================================================
  // Properties
  // ============================================================

  final List<T> values;

  final T selectedValue;

  final String Function(T value) labelBuilder;

  final ValueChanged<T> onSelected;

  /// If true, buttons fill the available width equally.
  /// If false, buttons keep their natural width and scroll horizontally.
  final bool expand;

  // ============================================================
  // Build
  // ============================================================

  @override
  Widget build(BuildContext context) {
    if (expand) {
      return Row(
        children: List.generate(values.length, (index) {
          final value = values[index];

          return Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                end: index == values.length - 1
                    ? 0
                    : AppSpacing.sm,
              ),
              child: _ChoiceButton(
                label: labelBuilder(value),
                selected: value == selectedValue,
                onTap: () => onSelected(value),
              ),
            ),
          );
        }),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(values.length, (index) {
          final value = values[index];

          return Padding(
            padding: EdgeInsetsDirectional.only(
              end: index == values.length - 1
                  ? 0
                  : AppSpacing.sm,
            ),
            child: _ChoiceButton(
              label: labelBuilder(value),
              selected: value == selectedValue,
              onTap: () => onSelected(value),
            ),
          );
        }),
      ),
    );
  }
}

// ============================================================
// Choice Button
// ============================================================

class _ChoiceButton extends StatelessWidget {
  const _ChoiceButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;

  final bool selected;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        alignment: Alignment.center,
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
          textAlign: TextAlign.center,
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