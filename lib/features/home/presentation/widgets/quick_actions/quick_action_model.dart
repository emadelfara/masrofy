// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

// ============================================================
// Quick Action Model
// ============================================================

class QuickActionModel {
  const QuickActionModel({
    required this.title,
    required this.icon,
    required this.onTap,
    this.showAddBadge = false,
  });

  // ============================================================
  // Properties
  // ============================================================

  final String title;

  final IconData icon;

  final void Function(BuildContext context) onTap;

  final bool showAddBadge;
}