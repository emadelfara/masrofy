// ============================================================
// Imports
// ============================================================

import 'package:masrofy/core/database/app_database.dart';
import 'package:masrofy/core/models/top_category_model.dart';

// ============================================================
// Goal Repository
// ============================================================

/// Handles goal-related database operations.
class GoalRepository {
  GoalRepository(this._database);

  final AppDatabase _database;

  // ============================================================
  // CRUD Operations
  // ============================================================

  /// Inserts a new goal.
  Future<int> insertGoal(GoalsCompanion goal) {
    return _database.insertGoal(goal);
  }

  /// Returns all goals.
  Future<List<Goal>> getAllGoals() {
    return _database.getAllGoals();
  }

  /// Returns a goal by its id.
  Future<Goal?> getGoalById(int id) {
    return _database.getGoalById(id);
  }

  /// Updates an existing goal.
  Future<bool> updateGoal(Goal goal) {
    return _database.updateGoal(goal);
  }

  /// Deletes a goal by its id.
  Future<int> deleteGoal(int id) {
    return _database.deleteGoal(id);
  }

  // ============================================================
  // Statistics
  // ============================================================

  /// Returns the top spending categories.
  Future<List<TopCategoryModel>> getTopCategories() {
    return _database.getTopCategories();
  }
}