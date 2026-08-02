// ============================================================
// Imports
// ============================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';

import 'repository_providers.dart';

// ============================================================
// Goal Notifier
// ============================================================

/// Manages goal data and CRUD operations.
class GoalNotifier extends AsyncNotifier<List<Goal>> {
  @override
  Future<List<Goal>> build() async {
    return ref.read(goalRepositoryProvider).getAllGoals();
  }

  // ============================================================
  // Public Methods
  // ============================================================

  /// Reloads all goals from the database.
  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => ref.read(goalRepositoryProvider).getAllGoals(),
    );
  }

  /// Inserts a new goal.
  Future<void> addGoal(GoalsCompanion goal) async {
    await ref.read(goalRepositoryProvider).insertGoal(goal);

    await refresh();
  }

  /// Updates an existing goal.
  Future<void> updateGoal(Goal goal) async {
    await ref.read(goalRepositoryProvider).updateGoal(goal);

    await refresh();
  }

  /// Deletes a goal.
  Future<void> deleteGoal(int id) async {
    await ref.read(goalRepositoryProvider).deleteGoal(id);

    await refresh();
  }
}

// ============================================================
// Provider
// ============================================================

/// Provides goal state throughout the application.
final goalProvider = AsyncNotifierProvider<GoalNotifier, List<Goal>>(
  GoalNotifier.new,
);