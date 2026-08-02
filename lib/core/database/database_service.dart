// ============================================================
// Imports
// ============================================================

import 'app_database.dart';
import 'database_initializer.dart';

/// Provides a single shared instance of the application database.
///
/// Responsible for creating the database instance and initializing
/// default database data when the application starts.
class DatabaseService {
  DatabaseService._() {
    _initialize();
  }

  // ============================================================
  // Singleton Instance
  // ============================================================

  static final DatabaseService instance = DatabaseService._();

  // ============================================================
  // Database Instance
  // ============================================================

  final AppDatabase database = AppDatabase();

  // ============================================================
  // Database Initialization
  // ============================================================

  Future<void> _initialize() async {
    await DatabaseInitializer.initialize(database);
  }
}