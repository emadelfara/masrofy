// ============================================================
// Imports
// ============================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/category_repository.dart';
import '../repositories/goal_repository.dart';
import '../repositories/transaction_repository.dart';

import 'database_provider.dart';

// ============================================================
// Repository Providers
// ============================================================

/// Provides the [CategoryRepository] instance.
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository(ref.watch(databaseProvider));
});

/// Provides the [TransactionRepository] instance.
final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepository(ref.watch(databaseProvider));
});

/// Provides the [GoalRepository] instance.
final goalRepositoryProvider = Provider<GoalRepository>((ref) {
  return GoalRepository(ref.watch(databaseProvider));
});