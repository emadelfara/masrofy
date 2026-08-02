// -----------------------------------------------------------------------------
// Drift Imports
// -----------------------------------------------------------------------------

import 'package:drift/drift.dart';

// -----------------------------------------------------------------------------
// Categories Table
// -----------------------------------------------------------------------------

class Categories extends Table {
  // ---------------------------------------------------------------------------
  // Primary Key
  // ---------------------------------------------------------------------------

  IntColumn get id => integer().autoIncrement()();

  // ---------------------------------------------------------------------------
  // Category Information
  // ---------------------------------------------------------------------------

  TextColumn get name => text()();

  // Stores icon key used by AppIcons mapper
  TextColumn get iconName => text()();

  // Stores Flutter Color value as integer
  IntColumn get color => integer()();

  // Category type: income or expense
  TextColumn get type => text()();
}