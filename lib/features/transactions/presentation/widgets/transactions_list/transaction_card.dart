// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/formatters/currency_formatter.dart';
import 'package:masrofy/core/models/transaction_model.dart';
import 'package:masrofy/core/theme/app_colors.dart';

import '../transaction_swipe_background.dart';

// ==========================
// Class
// ==========================

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
    required this.onDelete,
    required this.onEdit,
  });

  // ==========================
  // Properties
  // ==========================

  final TransactionModel transaction;

  final VoidCallback onDelete;

  final VoidCallback onEdit;

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    // ==========================
    // Amount Color
    // ==========================

    final amountColor = transaction.isIncome
        ? (isDark
            ? AppDarkColors.income
            : AppLightColors.income)
        : (isDark
            ? AppDarkColors.expense
            : AppLightColors.expense);

    return Dismissible(
      key: ValueKey(transaction.id),

      direction: DismissDirection.horizontal,

      // ==========================
      // Swipe Actions
      // ==========================

      background: const TransactionSwipeBackground(
        isDelete: false,
      ),

      secondaryBackground: const TransactionSwipeBackground(
        isDelete: true,
      ),

      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          onEdit();
          return false;
        }

        onDelete();
        return false;
      },

      // ==========================
      // Transaction Card
      // ==========================

      child: Card(
        margin: const EdgeInsets.only(
          bottom: AppSpacing.md,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.lg,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(
            AppSpacing.md,
          ),

          child: Row(
            children: [
              // ==========================
              // Category Icon
              // ==========================

              CircleAvatar(
                radius: 24,

                backgroundColor: transaction.category.color
                    .withValues(alpha: 0.12),

                child: Icon(
                  transaction.category.icon,

                  color: transaction.category.color,
                ),
              ),

              const SizedBox(
                width: AppSpacing.md,
              ),

              // ==========================
              // Transaction Information
              // ==========================

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      transaction.title,

                      maxLines: 1,

                      overflow: TextOverflow.ellipsis,

                      style: Theme.of(context)
                          .textTheme
                          .titleMedium,
                    ),

                    const SizedBox(
                      height: 4,
                    ),

                    Text(
                      transaction.category.name,

                      style: Theme.of(context)
                          .textTheme
                          .bodySmall,
                    ),

                    const SizedBox(
                      height: 4,
                    ),

                    Text(
                      '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',

                      style: Theme.of(context)
                          .textTheme
                          .bodySmall,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                width: AppSpacing.md,
              ),

              // ==========================
              // Transaction Amount
              // ==========================

              Text(
                '${transaction.isIncome ? '+' : '-'} ${CurrencyFormatter.format(transaction.amount)}',

                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                      color: amountColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}