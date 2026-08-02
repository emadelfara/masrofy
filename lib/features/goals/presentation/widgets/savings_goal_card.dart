// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/database/app_database.dart';
import 'package:masrofy/core/formatters/currency_formatter.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';
import 'package:masrofy/core/widgets/app_progress_bar.dart';


// ============================================================
// Savings Goal Card
// ============================================================

class SavingsGoalCard extends StatelessWidget {
  const SavingsGoalCard({
    super.key,
    required this.goal,
    required this.currentBalance,
  });



  // ============================================================
  // Properties
  // ============================================================

  final Goal goal;

  final double currentBalance;



  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {


    // ============================================================
    // Goal Progress Calculation
    // ============================================================

    final progress = goal.targetAmount == 0

        ? 0.0

        : (currentBalance / goal.targetAmount)
            .clamp(0.0, 1.0);



    final remaining =

        (goal.targetAmount - currentBalance)
            .clamp(
              0.0,
              double.infinity,
            );



    return Container(

      width: double.infinity,


      padding:
          const EdgeInsets.all(AppSpacing.lg),


      decoration: BoxDecoration(

        color:
            AppDarkColors.surface,


        borderRadius:
            BorderRadius.circular(AppRadius.xl),


        border:
            Border.all(
              color:
                  AppDarkColors.border,
            ),

      ),



      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,


        children: [



          // ============================================================
          // Card Header
          // ============================================================

          Row(

            children: [


              const Icon(

                Icons.flag_rounded,

                color:
                    AppDarkColors.primary,

              ),



              const SizedBox(

                width:
                    AppSpacing.sm,

              ),



              Text(

                'الهدف الحالي',


                style: AppTextStyles
                    .textTheme
                    .titleMedium
                    ?.copyWith(

                      fontWeight:
                          FontWeight.bold,


                      color:
                          AppDarkColors.textPrimary,

                    ),

              ),


            ],

          ),



          const SizedBox(

            height:
                AppSpacing.lg,

          ),



          // ============================================================
          // Goal Name
          // ============================================================

          Text(

            goal.title,


            style: AppTextStyles
                .textTheme
                .titleLarge
                ?.copyWith(

                  fontWeight:
                      FontWeight.bold,


                  color:
                      AppDarkColors.textPrimary,

                ),

          ),



          const SizedBox(

            height:
                AppSpacing.sm,

          ),



          // ============================================================
          // Saved / Target Amount
          // ============================================================

          Text(

            '${CurrencyFormatter.format(currentBalance)} / ${CurrencyFormatter.format(goal.targetAmount)}',


            style: AppTextStyles
                .textTheme
                .bodyMedium
                ?.copyWith(

                  color:
                      AppDarkColors.textSecondary,

                ),

          ),



          const SizedBox(

            height:
                AppSpacing.lg,

          ),



          // ============================================================
          // Progress Bar
          // ============================================================

          AppProgressBar(

            value:
                progress,

          ),



          const SizedBox(

            height:
                AppSpacing.md,

          ),



          // ============================================================
          // Progress Percentage
          // ============================================================

          Text(

            '${(progress * 100).toInt()}%',


            style: AppTextStyles
                .textTheme
                .titleMedium
                ?.copyWith(

                  color:
                      AppDarkColors.primary,


                  fontWeight:
                      FontWeight.bold,

                ),

          ),



          const SizedBox(

            height:
                AppSpacing.sm,

          ),



          // ============================================================
          // Remaining Amount
          // ============================================================

          Text(

            'المتبقي: ${CurrencyFormatter.format(remaining)}',


            style: AppTextStyles
                .textTheme
                .bodyMedium
                ?.copyWith(

                  color:
                      AppDarkColors.textSecondary,

                ),

          ),


        ],

      ),

    );

  }

}