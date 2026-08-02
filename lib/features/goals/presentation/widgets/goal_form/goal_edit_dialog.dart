// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/database/app_database.dart';
import 'package:masrofy/core/providers/goal_provider.dart';

import 'goal_form_body.dart';
import 'save_goal_button.dart';

// ============================================================
// Goal Edit Dialog
// ============================================================

class GoalEditDialog extends ConsumerStatefulWidget {
  const GoalEditDialog({
    super.key,
    required this.goal,
  });

  final Goal goal;

  @override
  ConsumerState<GoalEditDialog> createState() =>
      _GoalEditDialogState();
}


// ============================================================
// Goal Edit Dialog State
// ============================================================

class _GoalEditDialogState
    extends ConsumerState<GoalEditDialog> {


  // ============================================================
  // Form
  // ============================================================

  final _formKey = GlobalKey<FormState>();


  // ============================================================
  // Controllers
  // ============================================================

  late final TextEditingController _goalNameController;

  late final TextEditingController _targetAmountController;


  // ============================================================
  // Selected Date
  // ============================================================

  DateTime? selectedDate;


  // ============================================================
  // Lifecycle
  // ============================================================

  @override
  void initState() {
    super.initState();


    _goalNameController = TextEditingController(
      text: widget.goal.title,
    );


    _targetAmountController = TextEditingController(
      text: widget.goal.targetAmount.toString(),
    );


    selectedDate = widget.goal.deadline;
  }


  @override
  void dispose() {

    _goalNameController.dispose();

    _targetAmountController.dispose();


    super.dispose();

  }



  // ============================================================
  // Update Goal
  // ============================================================

  Future<void> _updateGoal() async {


    if (!_formKey.currentState!.validate()) {

      return;

    }


    if (selectedDate == null) {

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(

          content: Text(
            'من فضلك اختر تاريخ الهدف',
          ),

        ),

      );

      return;

    }


    final targetAmount = double.parse(
      _targetAmountController.text,
    );



    await ref.read(goalProvider.notifier).updateGoal(

      widget.goal.copyWith(

        title: _goalNameController.text.trim(),

        targetAmount: targetAmount,

        deadline: selectedDate!,

      ),

    );



    if (!mounted) return;


    Navigator.pop(context);

  }



  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {

    return Dialog(

      child: SingleChildScrollView(

        padding: const EdgeInsets.all(24),


        child: Form(

          key: _formKey,


          child: Column(

            children: [


              // ============================================================
              // Goal Form
              // ============================================================

              GoalFormBody(

                goalNameController:
                    _goalNameController,


                targetAmountController:
                    _targetAmountController,


                selectedDate: selectedDate,


                onDateSelected: (date) {

                  setState(() {

                    selectedDate = date;

                  });

                },

              ),



              const SizedBox(

                height: 24,

              ),



              // ============================================================
              // Save Button
              // ============================================================

              SaveGoalButton(

                onPressed: _updateGoal,

              ),


            ],

          ),

        ),

      ),

    );

  }

}