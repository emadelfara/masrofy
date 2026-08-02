// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/database/app_database.dart';
import 'package:masrofy/core/models/category_model.dart';
import 'package:masrofy/core/models/transaction_model.dart';
import 'package:masrofy/core/widgets/app_edit_dialog.dart';

import 'transaction_edit_form.dart';

// ==========================
// Class
// ==========================

class TransactionEditDialog extends StatelessWidget {
  const TransactionEditDialog({
    super.key,
    required this.transaction,
    required this.categories,
    required this.onSave,
  });

  // ==========================
  // Properties
  // ==========================

  final TransactionModel transaction;

  final List<CategoryModel> categories;

  final Future<void> Function(
    TransactionsCompanion companion,
  ) onSave;

  // ==========================
  // Build UI
  // ==========================

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<TransactionEditFormState>();

    return AppEditDialog(
      title: 'تعديل المعاملة',

      saveText: 'تحديث',

      child: TransactionEditForm(
        key: formKey,
        transaction: transaction,
        categories: categories,
      ),

      // ==========================
      // Save Action
      // ==========================

      onSave: () async {
        final companion = formKey.currentState?.submit();

        if (companion == null) {
          return;
        }

        await onSave(companion);
      },
    );
  }
}