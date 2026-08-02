// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/theme/app_colors.dart';

// ============================================================
// App Background
// ============================================================

/// Provides the default application background design.
class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ============================================================
        // Background Gradient
        // ============================================================

        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppDarkColors.primary,
                AppDarkColors.background,
              ],
            ),
          ),
        ),

        // ============================================================
        // Top Glow
        // ============================================================

        Positioned(
          top: -120,
          left: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppDarkColors.primary.withValues(
                alpha: 0.10,
              ),
            ),
          ),
        ),

        // ============================================================
        // Bottom Glow
        // ============================================================

        Positioned(
          bottom: -150,
          right: -120,
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppDarkColors.secondary.withValues(
                alpha: 0.05,
              ),
            ),
          ),
        ),
      ],
    );
  }
}