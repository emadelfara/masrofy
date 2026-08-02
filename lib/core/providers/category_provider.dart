// ============================================================
// Imports
// ============================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';

import 'repository_providers.dart';

// ============================================================
// Category Notifier
// ============================================================

/// Manages category data and CRUD operations.
class CategoryNotifier extends AsyncNotifier<List<Category>> {
  @override
  Future<List<Category>> build() async {
    return ref.read(categoryRepositoryProvider).getAllCategories();
  }

  // ============================================================
  // Public Methods
  // ============================================================

  /// Reloads all categories from the database.
  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => ref.read(categoryRepositoryProvider).getAllCategories(),
    );
  }

  /// Inserts a new category.
  Future<void> addCategory(CategoriesCompanion category) async {
    await ref.read(categoryRepositoryProvider).insertCategory(category);

    await refresh();
  }

  /// Updates an existing category.
  Future<void> updateCategory(Category category) async {
    await ref.read(categoryRepositoryProvider).updateCategory(category);

    await refresh();
  }

  /// Deletes a category.
  Future<void> deleteCategory(int id) async {
    await ref.read(categoryRepositoryProvider).deleteCategory(id);

    await refresh();
  }
}

// ============================================================
// Provider
// ============================================================

/// Provides category state throughout the application.
final categoryProvider =
    AsyncNotifierProvider<CategoryNotifier, List<Category>>(
      CategoryNotifier.new,
    );