// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_spacing.dart';

import 'goal_date_selector.dart';
import 'goal_name_field.dart';
import 'target_amount_field.dart';


// ============================================================
// Goal Form Body
// ============================================================

class GoalFormBody extends StatelessWidget {
  const GoalFormBody({
    super.key,
    required this.goalNameController,
    required this.targetAmountController,
    required this.selectedDate,
    required this.onDateSelected,
  });


  // ============================================================
  // Properties
  // ============================================================

  final TextEditingController goalNameController;

  final TextEditingController targetAmountController;

  final DateTime? selectedDate;

  final ValueChanged<DateTime> onDateSelected;



  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [


        // ============================================================
        // Goal Name Field
        // ============================================================

        GoalNameField(

          controller: goalNameController,

        ),



        const SizedBox(

          height: AppSpacing.lg,

        ),



        // ============================================================
        // Target Amount Field
        // ============================================================

        TargetAmountField(

          controller: targetAmountController,

        ),



        const SizedBox(

          height: AppSpacing.lg,

        ),



        // ============================================================
        // Goal Date Selector
        // ============================================================

        GoalDateSelector(

          selectedDate: selectedDate,

          onDateSelected: onDateSelected,

        ),


      ],

    );

  }

}