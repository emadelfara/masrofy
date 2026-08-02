// ============================================================
// Imports
// ============================================================

import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/database_service.dart';

// ============================================================
// User Settings Repository
// ============================================================

/// Handles user settings database operations.
class UserSettingsRepository {
  final AppDatabase _database = DatabaseService.instance.database;

  // ============================================================
  // Queries
  // ============================================================

  /// Returns current user settings.
  Future<UserSetting?> getUserSettings() {
    return _database.getUserSettings();
  }

  // ============================================================
  // Write Operations
  // ============================================================

  /// Creates or updates user settings.
  Future<void> saveUserSettings({
    required String nickname,
    required bool onboardingCompleted,
  }) async {
    final current = await _database.getUserSettings();

    if (current == null) {
      await _database.insertUserSettings(
        UserSettingsCompanion.insert(
          nickname: nickname,
          onboardingCompleted: Value(onboardingCompleted),
        ),
      );
    } else {
      await _database.updateUserSettings(
        current.copyWith(
          nickname: nickname,
          onboardingCompleted: onboardingCompleted,
        ),
      );
    }
  }

  /// Updates only the user's nickname.
  Future<void> updateNickname(String nickname) async {
    final current = await _database.getUserSettings();

    if (current == null) {
      return;
    }

    await _database.updateUserSettings(
      current.copyWith(
        nickname: nickname,
      ),
    );
  }
}