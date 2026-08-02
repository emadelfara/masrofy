// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/providers/stats_period_provider.dart';
import 'package:masrofy/core/widgets/app_background.dart';

import '../widgets/expenses_chart.dart';
import '../widgets/period_filter.dart';
import '../widgets/stats_header.dart';
import '../widgets/summary_cards.dart';
import '../widgets/top_categories_card.dart';

// ==========================
// Stats Screen
// ==========================

class StatsScreen extends ConsumerWidget {
  const StatsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final period = ref.watch(
      statsPeriodProvider,
    );

    return Scaffold(
      body: Stack(
        children: [

          // ==========================
          // Background
          // ==========================

          const AppBackground(),


          // ==========================
          // Screen Content
          // ==========================

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // Header

                  const StatsHeader(),


                  const SizedBox(
                    height: 24,
                  ),


                  // Period Selection

                  PeriodFilter(
                    selectedIndex: switch (period) {
                      StatsPeriod.week => 0,
                      StatsPeriod.month => 1,
                      StatsPeriod.year => 2,
                    },

                    onSelected: (index) {

                      ref
                          .read(statsPeriodProvider.notifier)
                          .state = switch (index) {

                        0 => StatsPeriod.week,

                        1 => StatsPeriod.month,

                        _ => StatsPeriod.year,
                      };
                    },
                  ),


                  const SizedBox(
                    height: 24,
                  ),


                  // Summary Information

                  const SummaryCards(),


                  const SizedBox(
                    height: 24,
                  ),


                  // Expense Chart

                  const ExpensesChart(),


                  const SizedBox(
                    height: 24,
                  ),


                  // Top Spending Categories

                  const TopCategoriesCard(),


                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}