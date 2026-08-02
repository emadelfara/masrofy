// ============================================================
// Imports
// ============================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';

// ============================================================
// Stats Period
// ============================================================

/// Represents available statistics time periods.
enum StatsPeriod {
  week,
  month,
  year,
}

// ============================================================
// Provider
// ============================================================

/// Stores the currently selected statistics period.
final statsPeriodProvider = StateProvider<StatsPeriod>((ref) {
  return StatsPeriod.week;
});