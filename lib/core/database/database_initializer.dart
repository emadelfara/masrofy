 // ============================================================
 // Imports
 // ============================================================

import '../constants/default_categories.dart';
import 'app_database.dart';

/// Responsible for initializing default database data.
///
/// This class inserts the default categories into the database
/// when the app runs for the first time.
class DatabaseInitializer {
  DatabaseInitializer._();

  // ============================================================
  // Initialize Database
  // ============================================================

  static Future<void> initialize(AppDatabase database) async {
    final existingCategories = await database.getAllCategories();

    final existingNames = existingCategories.map((e) => e.name).toSet();

    for (final category in DefaultCategories.all) {
      if (existingNames.contains(category.name)) {
        continue;
      }

      await database.insertCategory(
        CategoriesCompanion.insert(
          name: category.name,
          iconName: category.iconName,
          color: category.color.toARGB32(),
          type: category.type,
        ),
      );
    }
  }
}