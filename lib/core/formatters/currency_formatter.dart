// ============================================================
// Imports
// ============================================================

import 'package:intl/intl.dart';

/// Utility class responsible for formatting currency values.
///
/// Formats numbers using the Egyptian currency format (ج.م)
/// for displaying financial amounts across the application.
abstract final class CurrencyFormatter {
  CurrencyFormatter._();

  // ============================================================
  // Currency Formatting
  // ============================================================

  static final NumberFormat _formatter =
      NumberFormat.decimalPattern('en');

  static String format(double amount) {
    return '${_formatter.format(amount)} ج.م';
  }
}