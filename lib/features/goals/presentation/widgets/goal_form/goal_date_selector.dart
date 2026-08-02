// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// ============================================================
// Goal Date Selector
// ============================================================

class GoalDateSelector extends StatelessWidget {
  const GoalDateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  // ============================================================
  // Properties
  // ============================================================

  final DateTime? selectedDate;

  final ValueChanged<DateTime> onDateSelected;


  // ============================================================
  // Pick Date
  // ============================================================

  Future<void> _pickDate(BuildContext context) async {

    final now = DateTime.now();


    final pickedDate = await showDatePicker(

      context: context,

      locale: const Locale('ar'),

      initialDate: selectedDate ?? now,

      firstDate: DateTime(
        now.year,
        now.month,
        now.day,
      ),

      lastDate: DateTime(2100),

    );


    if (pickedDate != null) {

      onDateSelected(pickedDate);

    }

  }


  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {

    final formattedDate = selectedDate == null
        ? 'اختر تاريخ الهدف'
        : DateFormat(
            'dd MMMM yyyy',
            'ar',
          ).format(selectedDate!);


    return Column(

      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        // ============================================================
        // Label
        // ============================================================

        Text(

          'تاريخ الهدف',

          style: AppTextStyles.textTheme.titleMedium?.copyWith(

            color: AppDarkColors.textPrimary,

            fontWeight: FontWeight.bold,

          ),

        ),


        const SizedBox(

          height: AppSpacing.md,

        ),


        // ============================================================
        // Date Selector Field
        // ============================================================

        InkWell(

          borderRadius:
              BorderRadius.circular(AppRadius.lg),

          onTap: () => _pickDate(context),


          child: Ink(

            padding: const EdgeInsets.symmetric(

              horizontal: 16,

              vertical: 18,

            ),


            decoration: BoxDecoration(

              color: AppDarkColors.surface,

              borderRadius:
                  BorderRadius.circular(AppRadius.lg),

              border: Border.all(

                color: AppDarkColors.border,

              ),

            ),


            child: Row(

              children: [

                // ============================================================
                // Calendar Icon
                // ============================================================

                const Icon(

                  Icons.calendar_month_rounded,

                  color: AppDarkColors.primary,

                ),


                const SizedBox(

                  width: 12,

                ),


                // ============================================================
                // Selected Date
                // ============================================================

                Expanded(

                  child: Text(

                    formattedDate,

                    style: AppTextStyles.textTheme.bodyLarge?.copyWith(

                      color: selectedDate == null

                          ? AppDarkColors.textSecondary

                          : AppDarkColors.textPrimary,

                    ),

                  ),

                ),


                // ============================================================
                // Dropdown Icon
                // ============================================================

                const Icon(

                  Icons.keyboard_arrow_down_rounded,

                ),

              ],

            ),

          ),

        ),

      ],

    );

  }

}