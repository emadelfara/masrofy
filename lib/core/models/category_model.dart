// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import '../constants/app_icons.dart';

// ============================================================
// Category Model
// ============================================================

/// Represents a transaction category used throughout the application.
///
/// The icon is stored in the database as a string and converted
/// to [IconData] when needed.
class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.iconName,
    required this.color,
    required this.type,
  });

  // ============================================================
  // Properties
  // ============================================================

  /// Unique category identifier.
  final int id;

  /// Category display name.
  final String name;

  /// Icon name stored in the database.
  final String iconName;

  /// Category display color.
  final Color color;

  /// Category type.
  ///
  /// Expected values:
  /// - income
  /// - expense
  final String type;

  // ============================================================
  // Computed Properties
  // ============================================================

  /// Returns the Flutter icon associated with [iconName].
  IconData get icon => AppIcons.getCategoryIcon(iconName);
}