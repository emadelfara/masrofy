// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;

import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/database/app_database.dart';
import 'package:masrofy/core/providers/goal_provider.dart';
import 'package:masrofy/core/widgets/app_background.dart';
import 'package:masrofy/core/widgets/app_success_dialog.dart';

import '../widgets/goal_form/goal_form_body.dart';
import '../widgets/goal_form/goal_form_header.dart';
import '../widgets/goal_form/save_goal_button.dart';

// ============================================================
// Goal Form Screen
// ============================================================

class GoalFormScreen extends ConsumerStatefulWidget {
  const GoalFormScreen({
    super.key,
    this.goal,
  });

  final Goal? goal;

  @override
  ConsumerState<GoalFormScreen> createState() => _GoalFormScreenState();
}

// ============================================================
// Goal Form Screen State
// ============================================================

class _GoalFormScreenState extends ConsumerState<GoalFormScreen> {

  // ============================================================
  // Form
  // ============================================================

  final _formKey = GlobalKey<FormState>();


  // ============================================================
  // Controllers
  // ============================================================

  final TextEditingController _goalNameController =
      TextEditingController();

  final TextEditingController _targetAmountController =
      TextEditingController();


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

    _loadGoalData();
  }


  @override
  void dispose() {
    _goalNameController.dispose();
    _targetAmountController.dispose();

    super.dispose();
  }


  // ============================================================
  // Load Existing Goal Data
  // ============================================================

  void _loadGoalData() {
    if (widget.goal == null) return;

    _goalNameController.text = widget.goal!.title;

    _targetAmountController.text =
        widget.goal!.targetAmount.toString();

    selectedDate = widget.goal!.deadline;
  }


  // ============================================================
  // Save Goal
  // ============================================================

  Future<void> _saveGoal() async {

    if (!_formKey.currentState!.validate()) {
      return;
    }


    if (selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('من فضلك اختر تاريخ الهدف'),
        ),
      );

      return;
    }


    final targetAmount = double.parse(
      _targetAmountController.text,
    );


    // ============================================================
    // Add New Goal
    // ============================================================

    if (widget.goal == null) {

      await ref.read(goalProvider.notifier).addGoal(
        GoalsCompanion.insert(
          title: _goalNameController.text.trim(),
          targetAmount: targetAmount,
          deadline: selectedDate!,
          isCompleted: const Value(false),
        ),
      );

    }

    // ============================================================
    // Update Existing Goal
    // ============================================================

    else {

      await ref.read(goalProvider.notifier).updateGoal(
        widget.goal!.copyWith(
          title: _goalNameController.text.trim(),
          targetAmount: targetAmount,
          deadline: selectedDate!,
        ),
      );

    }


    if (!mounted) return;


    // ============================================================
    // Success Dialog
    // ============================================================

    await showDialog(
      context: context,
      barrierDismissible: false,

      builder: (_) => AppSuccessDialog(
        title: widget.goal == null
            ? 'تم إنشاء الهدف'
            : 'تم تعديل الهدف',

        message: widget.goal == null
            ? 'تم إنشاء هدف الادخار بنجاح.'
            : 'تم تعديل الهدف بنجاح.',

        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }


  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(

        children: [

          // ============================================================
          // Background
          // ============================================================

          const AppBackground(),


          // ============================================================
          // Screen Content
          // ============================================================

          SafeArea(

            child: SingleChildScrollView(

              padding: const EdgeInsets.all(
                AppSpacing.lg,
              ),

              child: Form(

                key: _formKey,

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    // ============================================================
                    // Header
                    // ============================================================

                    const GoalFormHeader(),


                    const SizedBox(
                      height: AppSpacing.xl,
                    ),


                    // ============================================================
                    // Form Body
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
                      height: AppSpacing.xl,
                    ),


                    // ============================================================
                    // Save Button
                    // ============================================================

                    SaveGoalButton(
                      onPressed: _saveGoal,
                    ),

                  ],

                ),

              ),

            ),

          ),

        ],

      ),

    );

  }

}