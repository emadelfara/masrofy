 // ============================================================
 // Imports
 // ============================================================

import 'package:flutter/material.dart';

import '../constants/app_icons.dart';

/// Utility class responsible for mapping category icon names
/// into Flutter IconData objects.
///
/// Used to retrieve category icons stored as strings in the database.
abstract final class CategoryIconMapper {
   CategoryIconMapper._();

  // ============================================================
  // Icon Mapping
  // ============================================================

  static IconData getIcon(String iconName) {
    return AppIcons.getCategoryIcon(iconName);
  }
}