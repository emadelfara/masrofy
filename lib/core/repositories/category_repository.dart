// ============================================================
// Imports
// ============================================================

import 'package:masrofy/core/database/app_database.dart';

// ============================================================
// Category Repository
// ============================================================

/// Handles category-related database operations.
class CategoryRepository {
  CategoryRepository(this._database);

  final AppDatabase _database;

  // ============================================================
  // CRUD Operations
  // ============================================================

  /// Inserts a new category.
  Future<int> insertCategory(CategoriesCompanion category) {
    return _database.insertCategory(category);
  }

  /// Returns all categories.
  Future<List<Category>> getAllCategories() {
    return _database.getAllCategories();
  }

  /// Returns a category by its id.
  Future<Category?> getCategoryById(int id) {
    return _database.getCategoryById(id);
  }

  /// Returns a category by its name.
  Future<Category?> getCategoryByName(String name) {
    return _database.getCategoryByName(name);
  }

  /// Updates an existing category.
  Future<bool> updateCategory(Category category) {
    return _database.updateCategory(category);
  }

  /// Deletes a category by its id.
  Future<int> deleteCategory(int id) {
    return _database.deleteCategory(id);
  }
}