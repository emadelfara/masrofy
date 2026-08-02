// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/formatters/currency_formatter.dart';
import 'package:masrofy/core/providers/finance_summary_provider.dart';
import 'package:masrofy/core/providers/goal_provider.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';
import 'package:masrofy/core/widgets/app_progress_bar.dart';


// ============================================================
// Savings Goal Card
// Home Screen Widget
// ============================================================

class SavingsGoalCard extends ConsumerWidget {
  const SavingsGoalCard({
    super.key,
  });



  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    // ============================================================
    // Providers
    // ============================================================

    final goalsAsync =
        ref.watch(goalProvider);


    final summaryAsync =
        ref.watch(financeSummaryProvider);



    return goalsAsync.when(


      // ============================================================
      // Loading State
      // ============================================================

      loading: () =>
          const SizedBox.shrink(),



      // ============================================================
      // Error State
      // ============================================================

      error: (_, _) =>
          const SizedBox.shrink(),



      data: (goals) {


        // ============================================================
        // Empty Goals State
        // ============================================================

        if (goals.isEmpty) {

          return const SizedBox.shrink();

        }



        return summaryAsync.when(


          loading: () =>
              const SizedBox.shrink(),



          error: (_, _) =>
              const SizedBox.shrink(),



          data: (summary) {


            // ============================================================
            // Current Goal
            // ============================================================

            final goal =
                goals.first;



            // ============================================================
            // Progress Calculation
            // ============================================================

            final progress =
                goal.targetAmount == 0

                    ? 0.0

                    : (summary.balance /
                            goal.targetAmount)
                        .clamp(
                          0.0,
                          1.0,
                        );



            return Container(

              padding:
                  const EdgeInsets.all(
                    AppSpacing.lg,
                  ),


              decoration: BoxDecoration(

                color:
                    AppDarkColors.surface,


                borderRadius:
                    BorderRadius.circular(
                      AppRadius.xl,
                    ),


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
                            Colors.amber,

                      ),



                      const SizedBox(

                        width:
                            AppSpacing.sm,

                      ),



                      Text(

                        'هدف الادخار',


                        style: AppTextStyles
                            .textTheme
                            .titleMedium
                            ?.copyWith(

                              color:
                                  AppDarkColors.textPrimary,


                              fontWeight:
                                  FontWeight.bold,

                            ),

                      ),


                    ],

                  ),



                  const SizedBox(

                    height:
                        AppSpacing.lg,

                  ),



                  // ============================================================
                  // Goal Title
                  // ============================================================

                  Text(

                    goal.title,


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
                  // Amounts
                  // ============================================================

                  Row(

                    children: [


                      Text(

                        CurrencyFormatter.format(
                          summary.balance,
                        ),


                        style:
                            AppTextStyles
                                .textTheme
                                .bodyMedium,

                      ),



                      const Spacer(),



                      Text(

                        CurrencyFormatter.format(
                          goal.targetAmount,
                        ),


                        style:
                            AppTextStyles
                                .textTheme
                                .bodyMedium,

                      ),


                    ],

                  ),


                ],

              ),

            );

          },

        );

      },

    );

  }

}