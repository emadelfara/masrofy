// ============================================================
// Imports
// ============================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/chart_bar_model.dart';

import 'database_provider.dart';
import 'stats_period_provider.dart';
import 'transaction_provider.dart';

// ============================================================
// Chart Provider
// ============================================================

/// Provides chart data based on the selected statistics period.
final chartProvider = FutureProvider<List<ChartBarModel>>((ref) async {
  final database = ref.watch(databaseProvider);

  final period = ref.watch(statsPeriodProvider);

  ref.watch(transactionProvider);

  return database.getChartData(period);
});