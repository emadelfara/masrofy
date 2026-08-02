// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/mappers/category_mapper.dart';
import 'package:masrofy/core/models/category_model.dart';
import 'package:masrofy/core/models/transaction_model.dart';
import 'package:masrofy/core/providers/category_provider.dart';
import 'package:masrofy/core/providers/transaction_provider.dart';
import 'package:masrofy/core/widgets/app_background.dart';
import 'package:masrofy/core/widgets/app_choice_chips.dart';
import 'package:masrofy/core/widgets/app_confirm_dialog.dart';

import '../models/transaction_sort.dart';
import '../widgets/search_bar/transactions_search_bar.dart';
import '../widgets/transaction_edit/transaction_edit_dialog.dart';
import '../widgets/transactions_header.dart';
import '../widgets/transactions_list/transactions_list.dart';
import 'transaction_form_screen.dart';

// ============================================================
// Transactions Screen
// ============================================================

class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({
    super.key,
  });

  @override
  ConsumerState<TransactionsScreen> createState() =>
      _TransactionsScreenState();
}

class _TransactionsScreenState
    extends ConsumerState<TransactionsScreen> {
  // ============================================================
  // Variables
  // ============================================================

  String _query = '';

  int _selectedFilter = 0;

  TransactionSort _sort = TransactionSort.newest;

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final transactionsAsync = ref.watch(transactionProvider);

    // ============================================================
    // Filter & Sort Transactions
    // ============================================================

    final List<TransactionModel> filteredTransactions =
        transactionsAsync.when<List<TransactionModel>>(
      data: (transactions) {
        final list = transactions.where((transaction) {
          final matchesSearch = transaction.title
              .toLowerCase()
              .contains(_query.toLowerCase());

          final matchesFilter = switch (_selectedFilter) {
            0 => true,
            1 => transaction.isIncome,
            2 => !transaction.isIncome,
            _ => true,
          };

          return matchesSearch && matchesFilter;
        }).toList();

        list.sort((a, b) {
          switch (_sort) {
            case TransactionSort.newest:
              return b.date.compareTo(a.date);

            case TransactionSort.oldest:
              return a.date.compareTo(b.date);

            case TransactionSort.highestAmount:
              return b.amount.compareTo(a.amount);

            case TransactionSort.lowestAmount:
              return a.amount.compareTo(b.amount);
          }
        });

        return list;
      },

      loading: () => <TransactionModel>[],

      error: (_, _) => <TransactionModel>[],
    );

    // ============================================================
    // Header Title
    // ============================================================

    final headerTitle = switch (_selectedFilter) {
      0 => _query.isEmpty ? 'جميع المعاملات' : 'نتائج البحث',
      1 => 'الدخل',
      2 => 'المصروفات',
      _ => 'المعاملات',
    };

    return Scaffold(
      body: Stack(
        children: [
          const AppBackground(),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 12),

                // ============================================================
                // Search Bar
                // ============================================================

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TransactionsSearchBar(
                    onChanged: (value) {
                      setState(() {
                        _query = value;
                      });
                    },
                  ),
                ),

                // ============================================================
                // Filter Chips
                // ============================================================

                AppChoiceChips<int>(
                  values: const [0, 1, 2],
                  selectedValue: _selectedFilter,
                  labelBuilder: (value) {
                    switch (value) {
                      case 0:
                        return 'الكل';

                      case 1:
                        return 'دخل';

                      case 2:
                        return 'مصروفات';

                      default:
                        return '';
                    }
                  },
                  onSelected: (value) {
                    setState(() {
                      _selectedFilter = value;
                    });
                  },
                ),

                // ============================================================
                // Header
                // ============================================================

                TransactionsHeader(
                  title: headerTitle,
                  count: filteredTransactions.length,
                  sort: _sort,
                  onSortSelected: (value) {
                    setState(() {
                      _sort = value;
                    });
                  },
                ),

                // ============================================================
                // Transactions List
                // ============================================================

                Expanded(
                  child: TransactionsList(
                    transactions: filteredTransactions,

                    // ========================================================
                    // Delete Transaction
                    // ========================================================

                    onDelete: (transaction) async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (_) {
                          return const AppConfirmDialog(
                            title: 'حذف المعاملة',
                            message: 'هل تريد حذف هذه المعاملة؟',
                          );
                        },
                      );

                      if (confirmed != true) {
                        return;
                      }

                      await ref
                          .read(transactionProvider.notifier)
                          .deleteTransaction(transaction.id);
                    },

                    // ========================================================
                    // Edit Transaction
                    // ========================================================

                    onEdit: (transaction) async {
                      final categoriesAsync =
                          ref.read(categoryProvider);

                      final categories = categoriesAsync.when(
                        data: (items) => items
                            .where(
                              (c) =>
                                  c.type ==
                                  (transaction.isIncome
                                      ? 'income'
                                      : 'expense'),
                            )
                            .map((c) => c.toModel())
                            .toList(),

                        loading: () => <CategoryModel>[],

                        error: (_, _) => <CategoryModel>[],
                      );

                      if (!context.mounted) {
                        return;
                      }

                      await showDialog(
                        context: context,
                        builder: (_) => TransactionEditDialog(
                          transaction: transaction,
                          categories: categories,
                          onSave: (companion) async {
                            await ref
                                .read(transactionProvider.notifier)
                                .updateTransactionFromCompanion(
                                  id: transaction.id,
                                  companion: companion,
                                  isIncome: transaction.isIncome,
                                );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // ============================================================
      // Floating Action Button
      // ============================================================

      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'transactions_fab',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const TransactionFormScreen(),
            ),
          );
        },
        icon: const Icon(Icons.add_rounded),
        label: const Text('إضافة'),
      ),
    );
  }
}