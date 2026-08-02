// ============================================================
// Imports
// ============================================================

import 'package:flutter/services.dart';

// ============================================================
// Native Launcher
// ============================================================

/// Handles communication with native platform features.
class NativeLauncher {
  NativeLauncher._();

  // ============================================================
  // Constants
  // ============================================================

  static const MethodChannel _channel = MethodChannel(
    'masrofy/native',
  );

  // ============================================================
  // Public Methods
  // ============================================================

  /// Opens a URL using the native platform.
  static Future<void> openUrl(String url) async {
    try {
      await _channel.invokeMethod(
        'openUrl',
        {
          'url': url,
        },
      );
    } on PlatformException catch (e) {
      throw Exception(
        'Failed to open url: ${e.message}',
      );
    }
  }
}