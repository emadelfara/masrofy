// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import '../constants/app_radius.dart';
import '../theme/app_colors.dart';

// ============================================================
// App Progress Bar
// ============================================================

/// A reusable progress bar widget.
class AppProgressBar extends StatelessWidget {
  const AppProgressBar({
    super.key,
    required this.value,
    this.height = 10,
    this.backgroundColor,
    this.progressColor,
  });

  // ============================================================
  // Properties
  // ============================================================

  /// Progress value between 0.0 and 1.0.
  final double value;

  /// Progress bar height.
  final double height;

  /// Background color.
  final Color? backgroundColor;

  /// Filled progress color.
  final Color? progressColor;

  // ============================================================
  // Build
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final progress = value.clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(
        AppRadius.full,
      ),
      child: SizedBox(
        height: height,
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor:
              backgroundColor ??
              AppDarkColors.border.withValues(
                alpha: 0.35,
              ),
          valueColor: AlwaysStoppedAnimation<Color>(
            progressColor ?? AppDarkColors.primary,
          ),
        ),
      ),
    );
  }
}