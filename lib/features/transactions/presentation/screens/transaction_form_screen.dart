// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/database/app_database.dart';
import 'package:masrofy/core/models/category_model.dart';
import 'package:masrofy/core/providers/category_provider.dart';
import 'package:masrofy/core/providers/repository_providers.dart';
import 'package:masrofy/core/providers/transaction_provider.dart';
import 'package:masrofy/core/widgets/app_background.dart';
import 'package:masrofy/core/widgets/app_success_dialog.dart';

import '../widgets/transaction_form/amount_field.dart';
import '../widgets/transaction_form/category_selector.dart';
import '../widgets/transaction_form/date_selector.dart';
import '../widgets/transaction_form/save_transaction_button.dart';
import '../widgets/transaction_form/transaction_form_header.dart';
import '../widgets/transaction_form/transaction_title_field.dart';
import '../widgets/transaction_form/transaction_type_selector.dart';

// ==========================
// Class
// ==========================

class TransactionFormScreen extends ConsumerStatefulWidget {
  const TransactionFormScreen({
    super.key,
  });

  @override
  ConsumerState<TransactionFormScreen> createState() =>
      _TransactionFormScreenState();
}

class _TransactionFormScreenState
    extends ConsumerState<TransactionFormScreen> {
  // ==========================
  // Form
  // ==========================

  final _formKey = GlobalKey<FormState>();

  // ==========================
  // State
  // ==========================

  bool isIncome = false;

  CategoryModel? selectedCategory;

  DateTime? selectedDate;

  String? _dateError;
  String? _categoryError;

  // ==========================
  // Controllers
  // ==========================

  final TextEditingController _titleController =
      TextEditingController();

  final TextEditingController _amountController =
      TextEditingController();

  // ==========================
  // Dispose
  // ==========================

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  // ==========================
  // Save Transaction
  // ==========================

  Future<void> _saveTransaction() async {
    if (selectedCategory == null) {
      setState(() {
        _categoryError = 'من فضلك اختر الفئة';
      });
      return;
    }

    if (selectedDate == null) {
      setState(() {
        _dateError = 'من فضلك اختر تاريخ المعاملة';
      });
      return;
    }

    final category = await ref
        .read(categoryRepositoryProvider)
        .getCategoryByName(selectedCategory!.name);

    if (category == null) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('الفئة غير موجودة في قاعدة البيانات'),
        ),
      );

      return;
    }

    await ref.read(transactionProvider.notifier).addTransaction(
          TransactionsCompanion.insert(
            title: _titleController.text,
            amount: double.parse(
              _amountController.text.trim(),
            ),
            categoryId: category.id,
            date: selectedDate!,
            isIncome: isIncome,
          ),
        );

    if (!mounted) {
      return;
    }

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AppSuccessDialog(
          title: 'تم حفظ المعاملة',
          message: 'تم حفظ المعاملة بنجاح.',
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoryProvider);

    final categories = categoriesAsync.when(
      data: (items) => items
          .where(
            (category) =>
                category.type ==
                (isIncome ? 'income' : 'expense'),
          )
          .map(
            (category) => CategoryModel(
              id: category.id,
              name: category.name,
              iconName: category.iconName,
              color: Color(category.color),
              type: category.type,
            ),
          )
          .toList(),
      loading: () => <CategoryModel>[],
      error: (_, _) => <CategoryModel>[],
    );

    return Scaffold(
      body: Stack(
        children: [
          const AppBackground(),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    // ==========================
                    // Header
                    // ==========================

                    const TransactionFormHeader(),

                    const SizedBox(
                      height: AppSpacing.xl,
                    ),

                    // ==========================
                    // Transaction Type
                    // ==========================

                    TransactionTypeSelector(
                      isIncome: isIncome,
                      onChanged: (value) {
                        setState(() {
                          isIncome = value;
                          selectedCategory = null;
                        });
                      },
                    ),

                    const SizedBox(
                      height: AppSpacing.lg,
                    ),

                    // ==========================
                    // Title
                    // ==========================

                    TransactionTitleField(
                      controller: _titleController,
                    ),

                    const SizedBox(
                      height: AppSpacing.lg,
                    ),

                    // ==========================
                    // Amount
                    // ==========================

                    AmountField(
                      controller: _amountController,
                    ),

                    const SizedBox(
                      height: AppSpacing.lg,
                    ),

                    // ==========================
                    // Category
                    // ==========================

                    CategorySelector(
                      categories: categories,
                      selectedCategory: selectedCategory,
                      errorText: _categoryError,
                      onChanged: (category) {
                        setState(() {
                          selectedCategory = category;
                          _categoryError = null;
                        });
                      },
                    ),

                    const SizedBox(
                      height: AppSpacing.lg,
                    ),

                    // ==========================
                    // Date
                    // ==========================

                    DateSelector(
                      selectedDate: selectedDate,
                      errorText: _dateError,
                      onDateSelected: (date) {
                        setState(() {
                          selectedDate = date;
                          _dateError = null;
                        });
                      },
                    ),

                    const SizedBox(
                      height: AppSpacing.xl,
                    ),

                    // ==========================
                    // Save Button
                    // ==========================

                    SaveTransactionButton(
                      onPressed: _saveTransaction,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}