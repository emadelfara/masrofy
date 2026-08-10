// ===========================================================================
// Imports
// ===========================================================================

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'package:masrofy/core/models/chart_bar_model.dart';
import 'package:masrofy/core/models/top_category_model.dart';
import 'package:masrofy/core/providers/stats_period_provider.dart';

import 'tables/categories.dart';
import 'tables/goals.dart';
import 'tables/transactions.dart';
import 'tables/user_settings.dart';

// ===========================================================================
// Generated Files
// ===========================================================================

part 'app_database.g.dart';

// ===========================================================================
// App Database
// ===========================================================================

@DriftDatabase(tables: [Categories, Transactions, Goals, UserSettings])
class AppDatabase extends _$AppDatabase {
  // ===========================================================================
  // Constructor
  // ===========================================================================

  AppDatabase() : super(driftDatabase(name: 'masrofy'));

  // ===========================================================================
  // Database Configuration
  // ===========================================================================

  @override
  int get schemaVersion => 3;

  // ===========================================================================
  // Database Migration
  // ===========================================================================

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },

    onUpgrade: (Migrator m, int from, int to) async {
      // No migrations yet.
      //
      // Schema version 3 is the initial production database schema.
      // Future schema changes must be handled using proper migrations
      // without deleting user data.
    },

    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  // ===========================================================================
  // Categories CRUD
  // ===========================================================================

  Future<int> insertCategory(CategoriesCompanion category) {
    return into(categories).insert(category);
  }

  Future<List<Category>> getAllCategories() {
    return select(categories).get();
  }

  Future<Category?> getCategoryById(int id) {
    return (select(
      categories,
    )..where((c) => c.id.equals(id))).getSingleOrNull();
  }

  Future<Category?> getCategoryByName(String name) {
    return (select(
      categories,
    )..where((c) => c.name.equals(name))).getSingleOrNull();
  }

  Future<bool> updateCategory(Category category) {
    return update(categories).replace(category);
  }

  Future<int> deleteCategory(int id) {
    return (delete(categories)..where((c) => c.id.equals(id))).go();
  }

  // ==========================================================================
  // Transactions CRUD
  // ==========================================================================

  /// Inserts a new transaction.
  Future<int> insertTransaction(TransactionsCompanion transaction) {
    return into(transactions).insert(transaction);
  }

  /// Returns all transactions.
  Future<List<Transaction>> getAllTransactions() {
    return select(transactions).get();
  }

  /// Returns a transaction by its ID.
  Future<Transaction?> getTransactionById(int id) {
    return (select(
      transactions,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Updates an existing transaction.
  Future<bool> updateTransaction(Transaction transaction) {
    return update(transactions).replace(transaction);
  }

  /// Deletes a transaction by its ID.
  Future<int> deleteTransaction(int id) {
    return (delete(transactions)..where((t) => t.id.equals(id))).go();
  }

  // ==========================================================================
  // Goals CRUD
  // ==========================================================================

  /// Inserts a new goal.
  Future<int> insertGoal(GoalsCompanion goal) {
    return into(goals).insert(goal);
  }

  /// Returns all goals.
  Future<List<Goal>> getAllGoals() {
    return select(goals).get();
  }

  /// Returns a goal by its ID.
  Future<Goal?> getGoalById(int id) {
    return (select(goals)..where((g) => g.id.equals(id))).getSingleOrNull();
  }

  /// Updates an existing goal.
  Future<bool> updateGoal(Goal goal) {
    return update(goals).replace(goal);
  }

  /// Deletes a goal by its ID.
  Future<int> deleteGoal(int id) {
    return (delete(goals)..where((g) => g.id.equals(id))).go();
  }

  // ==========================================================================
  // User Settings CRUD
  // ==========================================================================

  /// Inserts user settings.
  Future<int> insertUserSettings(UserSettingsCompanion settings) {
    return into(userSettings).insert(settings);
  }

  /// Returns the current user settings.
  Future<UserSetting?> getUserSettings() {
    return select(userSettings).getSingleOrNull();
  }

  /// Updates the user settings.
  Future<bool> updateUserSettings(UserSetting settings) {
    return update(userSettings).replace(settings);
  }

  /// Deletes the user settings.
  Future<int> deleteUserSettings() {
    return delete(userSettings).go();
  }

  // ==========================================================================
  // Balance Methods
  // ==========================================================================

  /// Calculates and returns the current account balance.
  Future<double> getCurrentBalance() async {
    final allTransactions = await select(transactions).get();

    double balance = 0;

    for (final transaction in allTransactions) {
      if (transaction.isIncome) {
        balance += transaction.amount;
      } else {
        balance -= transaction.amount;
      }
    }

    return balance;
  }

  // ==========================================================================
  // Categories Analytics
  // ==========================================================================

  /// Returns the top 3 expense categories based on total spending.
  Future<List<TopCategoryModel>> getTopCategories() async {
    final allTransactions = await select(transactions).get();
    final allCategories = await select(categories).get();

    final expenses = allTransactions.where((t) => !t.isIncome).toList();

    if (expenses.isEmpty) {
      return [];
    }

    final Map<int, double> totals = {};

    for (final transaction in expenses) {
      totals.update(
        transaction.categoryId,
        (value) => value + transaction.amount,
        ifAbsent: () => transaction.amount,
      );
    }

    final totalExpense = totals.values.fold<double>(
      0,
      (sum, value) => sum + value,
    );

    final result = totals.entries.map((entry) {
      final category = allCategories.firstWhere((c) => c.id == entry.key);

      return TopCategoryModel(
        categoryId: category.id,
        title: category.name,
        amount: entry.value,
        progress: totalExpense == 0 ? 0 : entry.value / totalExpense,
      );
    }).toList();

    result.sort((a, b) => b.amount.compareTo(a.amount));

    return result.take(3).toList();
  }

  // ==========================================================================
  // Chart Data
  // ==========================================================================

  /// Returns chart data based on the selected statistics period.
  Future<List<ChartBarModel>> getChartData(StatsPeriod period) {
    switch (period) {
      case StatsPeriod.week:
        return getWeeklyChartData();

      case StatsPeriod.month:
        return getMonthlyChartData();

      case StatsPeriod.year:
        return getYearlyChartData();
    }
  }

  // ==========================================================================
  // Chart Generators
  // ==========================================================================

  /// Generates chart data for the current week.
  Future<List<ChartBarModel>> getWeeklyChartData() async {
    final allTransactions = await select(transactions).get();

    final expenses = allTransactions.where((t) => !t.isIncome).toList();

    final now = DateTime.now();

    final weekStart = DateTime(
      now.year,
      now.month,
      now.day - ((now.weekday + 1) % 7),
    );

    final weekEnd = weekStart.add(const Duration(days: 6));

    final dailyExpenses = List<double>.filled(7, 0);

    for (final transaction in expenses) {
      final date = DateTime(
        transaction.date.year,
        transaction.date.month,
        transaction.date.day,
      );

      if (date.isBefore(weekStart) || date.isAfter(weekEnd)) {
        continue;
      }

      final index = date.difference(weekStart).inDays;

      dailyExpenses[index] += transaction.amount;
    }

    const labels = ['س', 'أ', 'ن', 'ث', 'ر', 'خ', 'ج'];

    return List.generate(
      7,
      (index) =>
          ChartBarModel(label: labels[index], amount: dailyExpenses[index]),
    );
  }

  /// Generates chart data for the current month.
  Future<List<ChartBarModel>> getMonthlyChartData() async {
    final allTransactions = await select(transactions).get();

    final expenses = allTransactions.where((t) => !t.isIncome).toList();

    final now = DateTime.now();

    final monthStart = DateTime(now.year, now.month, 1);

    final monthEnd = DateTime(now.year, now.month + 1, 0);

    final numberOfWeeks = ((monthEnd.day - 1) ~/ 7) + 1;

    final weeklyExpenses = List<double>.filled(numberOfWeeks, 0);

    for (final transaction in expenses) {
      final date = DateTime(
        transaction.date.year,
        transaction.date.month,
        transaction.date.day,
      );

      if (date.isBefore(monthStart) || date.isAfter(monthEnd)) {
        continue;
      }

      final weekIndex = (date.day - 1) ~/ 7;

      weeklyExpenses[weekIndex] += transaction.amount;
    }

    return List.generate(
      numberOfWeeks,
      (index) =>
          ChartBarModel(label: 'أ${index + 1}', amount: weeklyExpenses[index]),
    );
  }

  /// Generates chart data for the current year.
  Future<List<ChartBarModel>> getYearlyChartData() async {
    final allTransactions = await select(transactions).get();

    final expenses = allTransactions.where((t) => !t.isIncome).toList();

    final now = DateTime.now();

    final monthlyExpenses = List<double>.filled(12, 0);

    for (final transaction in expenses) {
      if (transaction.date.year != now.year) {
        continue;
      }

      final monthIndex = transaction.date.month - 1;

      monthlyExpenses[monthIndex] += transaction.amount;
    }

    const labels = [
      'ينا',
      'فبر',
      'مار',
      'ابر',
      'ماي',
      'يون',
      'يول',
      'أغ',
      'سبت',
      'أكت',
      'نوف',
      'ديس',
    ];

    return List.generate(
      12,
      (index) =>
          ChartBarModel(label: labels[index], amount: monthlyExpenses[index]),
    );
  }
}
