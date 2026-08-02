// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import '../database/app_database.dart';
import '../models/category_model.dart';

// ============================================================
// Category Mapper
// ============================================================

/// Extension responsible for converting a database [Category]
/// into the application's [CategoryModel].
extension CategoryMapper on Category {
  // ============================================================
  // Database → Model
  // ============================================================

  CategoryModel toModel() {
    return CategoryModel(
      id: id,
      name: name,
      iconName: iconName,
      color: Color(color),
      type: type,
    );
  }
}