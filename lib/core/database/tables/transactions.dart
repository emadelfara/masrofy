// -----------------------------------------------------------------------------
// Drift Imports
// -----------------------------------------------------------------------------

import 'package:drift/drift.dart';

import 'categories.dart';

// -----------------------------------------------------------------------------
// Transactions Table
// -----------------------------------------------------------------------------

class Transactions extends Table {
  // ---------------------------------------------------------------------------
  // Primary Key
  // ---------------------------------------------------------------------------

  IntColumn get id => integer().autoIncrement()();

  // ---------------------------------------------------------------------------
  // Transaction Information
  // ---------------------------------------------------------------------------

  // Transaction title
  TextColumn get title => text()();

  // Transaction amount
  RealColumn get amount => real()();

  // Related category reference
  IntColumn get categoryId =>
      integer().references(Categories, #id, onDelete: KeyAction.restrict)();

  // Transaction date
  DateTimeColumn get date => dateTime()();

  // Optional transaction notes
  TextColumn get notes => text().nullable()();

  // ---------------------------------------------------------------------------
  // Transaction Type
  // ---------------------------------------------------------------------------

  // True = income, False = expense
  BoolColumn get isIncome => boolean()();
}