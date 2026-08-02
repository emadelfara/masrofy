// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/providers/user_settings_provider.dart';
import 'package:masrofy/core/widgets/app_background.dart';
import 'package:masrofy/features/home/presentation/widgets/balance_section.dart';
import 'package:masrofy/features/home/presentation/widgets/quick_actions/quick_actions.dart';
import 'package:masrofy/features/home/presentation/widgets/recent_transactions/recent_transactions_section.dart';
import 'package:masrofy/features/home/presentation/widgets/savings_goal_card.dart';
import 'package:masrofy/features/home/presentation/widgets/welcome_header.dart';

// ============================================================
// Home Screen
// ============================================================

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
    required this.onOpenTransactions,
  });

  // ============================================================
  // Properties
  // ============================================================

  final VoidCallback onOpenTransactions;

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userSettings = ref.watch(userSettingsProvider);

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
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ============================================================
                    // Welcome Header
                    // ============================================================

                    userSettings.when(
                      data: (settings) => WelcomeHeader(
                        username: settings?.nickname ?? 'مستخدم',
                      ),
                      loading: () => const WelcomeHeader(
                        username: '...',
                      ),
                      error: (_, _) => const WelcomeHeader(
                        username: 'مستخدم',
                      ),
                    ),

                    const SizedBox(
                      height: AppSpacing.lg,
                    ),

                    // ============================================================
                    // Balance Section
                    // ============================================================

                    const BalanceSection(),

                    const SizedBox(
                      height: AppSpacing.xl,
                    ),

                    // ============================================================
                    // Recent Transactions
                    // ============================================================

                    RecentTransactionsSection(
                      onSeeAllPressed: onOpenTransactions,
                    ),

                    const SizedBox(
                      height: AppSpacing.xl,
                    ),

                    // ============================================================
                    // Quick Actions
                    // ============================================================

                    const QuickActions(),

                    const SizedBox(
                      height: AppSpacing.xl,
                    ),

                    // ============================================================
                    // Savings Goal
                    // ============================================================

                    const SavingsGoalCard(),

                    const SizedBox(
                      height: 24,
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