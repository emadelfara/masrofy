// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// ==========================
// Class
// ==========================

class DateSelector extends StatelessWidget {
  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    this.errorText,
  });

  // ==========================
  // Variables
  // ==========================

  final DateTime? selectedDate;

  final ValueChanged<DateTime> onDateSelected;

  final String? errorText;

  // ==========================
  // Pick Date
  // ==========================

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      locale: const Locale('ar'),
    );

    if (pickedDate != null) {
      onDateSelected(pickedDate);
    }
  }

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'التاريخ',
          style: AppTextStyles.textTheme.titleMedium?.copyWith(
            color: AppDarkColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        InkWell(
          onTap: () => _pickDate(context),
          borderRadius: BorderRadius.circular(AppRadius.lg),

          child: InputDecorator(
            decoration: InputDecoration(
              errorText: errorText,

              prefixIcon: const Icon(
                Icons.calendar_today_rounded,
              ),

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
            ),

            child: Text(
              selectedDate == null
                  ? 'اختر التاريخ'
                  : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',

              style: AppTextStyles.textTheme.bodyLarge?.copyWith(
                color: selectedDate == null
                    ? Colors.grey
                    : AppDarkColors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}