// ============================================================
// Greeting Utils
// ============================================================

/// Provides helper methods for generating greeting messages.
abstract final class GreetingUtils {
  GreetingUtils._();

  // ============================================================
  // Public Methods
  // ============================================================

  /// Returns a greeting message based on the current time.
  static String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'صباح الخير ☀️';
    }

    if (hour >= 12 && hour < 17) {
      return 'مساء الخير 🌤️';
    }

    if (hour >= 17 && hour < 22) {
      return 'مساء الخير 🌆';
    }

    return 'مساء الخير 🌙';
  }
}