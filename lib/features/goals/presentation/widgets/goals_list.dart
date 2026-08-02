// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/database/app_database.dart';
import 'package:masrofy/core/providers/goal_provider.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';
import 'package:masrofy/core/widgets/app_confirm_dialog.dart';

import 'goal_form/goal_edit_dialog.dart';
import 'goal_tile.dart';


// ============================================================
// Goals List
// ============================================================

class GoalsList extends ConsumerWidget {
  const GoalsList({
    super.key,
    required this.goals,
    required this.currentBalance,
    required this.selectedGoal,
    required this.onGoalSelected,
  });



  // ============================================================
  // Properties
  // ============================================================

  final List<Goal> goals;

  final double currentBalance;

  final Goal? selectedGoal;

  final ValueChanged<Goal> onGoalSelected;



  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Column(

      crossAxisAlignment:
          CrossAxisAlignment.start,


      children: [


        // ============================================================
        // Section Title
        // ============================================================

        Text(

          'الأهداف',


          style: AppTextStyles
              .textTheme
              .titleLarge
              ?.copyWith(

                color:
                    AppDarkColors.textPrimary,


                fontWeight:
                    FontWeight.bold,

              ),

        ),



        const SizedBox(

          height: AppSpacing.lg,

        ),



        // ============================================================
        // Empty State
        // ============================================================

        if (goals.isEmpty)

          const Center(

            child: Padding(

              padding:
                  EdgeInsets.symmetric(
                    vertical: 32,
                  ),


              child: Text(

                'لا توجد أهداف حالياً',

              ),

            ),

          )



        // ============================================================
        // Goals Items
        // ============================================================

        else

          ...goals.map(

            (goal) => Padding(

              padding:
                  const EdgeInsets.only(
                    bottom: AppSpacing.md,
                  ),


              child: GoalTile(

                title:
                    goal.title,


                progress:
                    (currentBalance /
                            goal.targetAmount)
                        .clamp(0.0, 1.0),


                isSelected:
                    selectedGoal?.id ==
                        goal.id,


                onTap: () {

                  onGoalSelected(goal);

                },



                // ============================================================
                // Edit Goal
                // ============================================================

                onEdit: () {


                  showDialog(

                    context: context,


                    builder: (_) => GoalEditDialog(

                      goal: goal,

                    ),

                  );


                },



                // ============================================================
                // Delete Goal
                // ============================================================

                onDelete: () async {


                  final confirm =
                      await showDialog<bool>(

                    context: context,


                    builder: (_) =>
                        const AppConfirmDialog(

                          title:
                              'حذف الهدف',


                          message:
                              'هل أنت متأكد أنك تريد حذف هذا الهدف؟',


                          confirmText:
                              'حذف',


                          cancelText:
                              'إلغاء',

                        ),

                  );



                  if (confirm == true) {


                    await ref
                        .read(goalProvider.notifier)
                        .deleteGoal(goal.id);


                  }


                },

              ),

            ),

          ),


      ],

    );

  }

}