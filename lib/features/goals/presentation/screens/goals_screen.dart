// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/database/app_database.dart';
import 'package:masrofy/core/providers/finance_summary_provider.dart';
import 'package:masrofy/core/providers/goal_provider.dart';
import 'package:masrofy/core/widgets/app_background.dart';

import '../widgets/goals_header.dart';
import '../widgets/goals_list.dart';
import '../widgets/savings_goal_card.dart';

import 'goal_form_screen.dart';

// ============================================================
// Goals Screen
// ============================================================

class GoalsScreen extends ConsumerStatefulWidget {
  const GoalsScreen({
    super.key,
  });

  @override
  ConsumerState<GoalsScreen> createState() => _GoalsScreenState();
}

// ============================================================
// Goals Screen State
// ============================================================

class _GoalsScreenState extends ConsumerState<GoalsScreen> {

  // ============================================================
  // Selected Goal
  // ============================================================

  Goal? selectedGoal;

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final goalsAsync = ref.watch(goalProvider);
    final summaryAsync = ref.watch(financeSummaryProvider);

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
            child: goalsAsync.when(

              // ============================================================
              // Loading State
              // ============================================================

              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),


              // ============================================================
              // Error State
              // ============================================================

              error: (error, stack) => Center(
                child: Text(
                  error.toString(),
                ),
              ),


              // ============================================================
              // Goals Data
              // ============================================================

              data: (goals) {

                if (goals.isNotEmpty && selectedGoal == null) {
                  selectedGoal = goals.first;
                }


                return summaryAsync.when(

                  // ============================================================
                  // Summary Loading
                  // ============================================================

                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),


                  // ============================================================
                  // Summary Error
                  // ============================================================

                  error: (error, stack) => Center(
                    child: Text(
                      error.toString(),
                    ),
                  ),


                  // ============================================================
                  // Screen Body
                  // ============================================================

                  data: (summary) {

                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          // ============================================================
                          // Header
                          // ============================================================

                          const GoalsHeader(),


                          const SizedBox(
                            height: 24,
                          ),


                          // ============================================================
                          // Main Savings Goal
                          // ============================================================

                          if (goals.isNotEmpty)
                            SavingsGoalCard(
                              goal: selectedGoal!,
                              currentBalance: summary.balance,
                            ),


                          if (goals.isNotEmpty)
                            const SizedBox(
                              height: 32,
                            ),


                          // ============================================================
                          // Goals List
                          // ============================================================

                          GoalsList(
                            goals: goals,
                            currentBalance: summary.balance,
                            selectedGoal: selectedGoal,

                            onGoalSelected: (goal) {
                              setState(() {
                                selectedGoal = goal;
                              });
                            },
                          ),


                          const SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),


      // ============================================================
      // Add Goal Button
      // ============================================================

      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'goals_fab',

        onPressed: () async {

          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const GoalFormScreen(),
            ),
          );

          ref
              .read(goalProvider.notifier)
              .refresh();
        },

        icon: const Icon(
          Icons.add_rounded,
        ),

        label: const Text(
          'إضافة',
        ),
      ),
    );
  }
}