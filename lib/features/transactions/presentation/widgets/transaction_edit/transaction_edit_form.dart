// ==========================
// Imports
// ==========================

import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';

import 'package:masrofy/core/database/app_database.dart';
import 'package:masrofy/core/models/category_model.dart';
import 'package:masrofy/core/models/transaction_model.dart';

import '../transaction_form/amount_field.dart';
import '../transaction_form/category_selector.dart';
import '../transaction_form/date_selector.dart';
import '../transaction_form/transaction_title_field.dart';

// ==========================
// Class
// ==========================

class TransactionEditForm extends StatefulWidget {
  const TransactionEditForm({
    super.key,
    required this.transaction,
    required this.categories,
  });

  // ==========================
  // Properties
  // ==========================

  final TransactionModel transaction;

  final List<CategoryModel> categories;

  // ==========================
  // State
  // ==========================

  @override
  State<TransactionEditForm> createState() => TransactionEditFormState();
}

// ==========================
// Form State
// ==========================

class TransactionEditFormState extends State<TransactionEditForm> {
  // ==========================
  // Form
  // ==========================

  final _formKey = GlobalKey<FormState>();

  // ==========================
  // Controllers
  // ==========================

  late final TextEditingController _titleController;

  late final TextEditingController _amountController;

  // ==========================
  // Selected Values
  // ==========================

  CategoryModel? _selectedCategory;

  DateTime? _selectedDate;

  // ==========================
  // Init
  // ==========================

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(
      text: widget.transaction.title,
    );

    _amountController = TextEditingController(
      text: widget.transaction.amount.toString(),
    );

    _selectedCategory = widget.transaction.category;

    _selectedDate = widget.transaction.date;
  }

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
  // Submit Form
  // ==========================

  TransactionsCompanion? submit() {
    if (!_formKey.currentState!.validate()) {
      return null;
    }

    if (_selectedCategory == null || _selectedDate == null) {
      return null;
    }

    return TransactionsCompanion(
      title: Value(
        _titleController.text.trim(),
      ),

      amount: Value(
        double.parse(
          _amountController.text.trim(),
        ),
      ),

      categoryId: Value(
        _selectedCategory!.id,
      ),

      date: Value(
        _selectedDate!,
      ),
    );
  }

  // ==========================
  // Build UI
  // ==========================

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            TransactionTitleField(
              controller: _titleController,
            ),

            const SizedBox(
              height: 16,
            ),

            AmountField(
              controller: _amountController,
            ),

            const SizedBox(
              height: 16,
            ),

            CategorySelector(
              categories: widget.categories,

              selectedCategory: _selectedCategory,

              onChanged: (category) {
                setState(() {
                  _selectedCategory = category;
                });
              },
            ),

            const SizedBox(
              height: 16,
            ),

            DateSelector(
              selectedDate: _selectedDate,

              onDateSelected: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}