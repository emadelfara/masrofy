// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_icons.dart';
import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/theme/app_colors.dart';

// ==========================
// Class
// ==========================

class TransactionSwipeBackground extends StatelessWidget {
  const TransactionSwipeBackground({
    super.key,
    required this.isDelete,
  });

  // ==========================
  // Properties
  // ==========================

  final bool isDelete;

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    // ==========================
    // Swipe Action Style
    // ==========================

    final color = isDelete
        ? AppDarkColors.expense
        : AppDarkColors.primary;

    final icon = isDelete
        ? AppIcons.delete
        : AppIcons.edit;

    // ==========================
    // Swipe Background
    // ==========================

    return Container(
      color: Colors.transparent,

      alignment: isDelete
          ? Alignment.centerLeft
          : Alignment.centerRight,

      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),

      child: Container(
        width: 48,

        height: 48,

        decoration: BoxDecoration(
          color: color,

          borderRadius: BorderRadius.circular(
            AppRadius.md,
          ),
        ),

        child: Icon(
          icon,

          color: Colors.white,

          size: 22,
        ),
      ),
    );
  }
}