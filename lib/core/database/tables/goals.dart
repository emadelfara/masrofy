// -----------------------------------------------------------------------------
// Drift Imports
// -----------------------------------------------------------------------------

import 'package:drift/drift.dart';

// -----------------------------------------------------------------------------
// Goals Table
// -----------------------------------------------------------------------------

class Goals extends Table {
  // ---------------------------------------------------------------------------
  // Primary Key
  // ---------------------------------------------------------------------------

  IntColumn get id => integer().autoIncrement()();

  // ---------------------------------------------------------------------------
  // Goal Information
  // ---------------------------------------------------------------------------

  TextColumn get title => text()();

  // Target amount required to complete the goal
  RealColumn get targetAmount => real()();

  // Goal deadline date
  DateTimeColumn get deadline => dateTime()();

  // ---------------------------------------------------------------------------
  // Goal Status
  // ---------------------------------------------------------------------------

  // Indicates whether the goal has been completed
  BoolColumn get isCompleted =>
      boolean().withDefault(const Constant(false))();

  // ---------------------------------------------------------------------------
  // Metadata
  // ---------------------------------------------------------------------------

  // Goal creation timestamp
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}