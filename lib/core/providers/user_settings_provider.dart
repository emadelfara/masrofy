// ============================================================
// Imports
// ============================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/user_settings_repository.dart';

// ============================================================
// Repository Provider
// ============================================================

/// Provides the [UserSettingsRepository] instance.
final userSettingsRepositoryProvider =
    Provider<UserSettingsRepository>((ref) {
  return UserSettingsRepository();
});

// ============================================================
// User Settings Provider
// ============================================================

/// Provides current user settings data.
final userSettingsProvider = FutureProvider((ref) async {
  final repository = ref.watch(userSettingsRepositoryProvider);

  return repository.getUserSettings();
});

// ============================================================
// User Settings Notifier Provider
// ============================================================

/// Provides user settings update actions.
final userSettingsNotifierProvider = Provider<UserSettingsNotifier>((ref) {
  return UserSettingsNotifier(ref);
});

// ============================================================
// User Settings Notifier
// ============================================================

/// Handles user settings related actions.
class UserSettingsNotifier {
  UserSettingsNotifier(this.ref);

  final Ref ref;

  // ============================================================
  // Public Methods
  // ============================================================

  /// Updates the current user's nickname.
  Future<void> updateNickname(String nickname) async {
    final repository = ref.read(userSettingsRepositoryProvider);

    await repository.updateNickname(nickname);

    ref.invalidate(userSettingsProvider);
  }
}