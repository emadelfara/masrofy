// ============================================================
// Imports
// ============================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import '../database/database_service.dart';

// ============================================================
// Database Provider
// ============================================================

/// Provides a singleton instance of [AppDatabase]
/// throughout the application.
final databaseProvider = Provider<AppDatabase>((ref) {
  return DatabaseService.instance.database;
});