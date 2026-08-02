// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

// ==========================
// Class
// ==========================

class TransactionTitleField extends StatelessWidget {
  const TransactionTitleField({
    super.key,
    required this.controller,
  });

  // ==========================
  // Variables
  // ==========================

  final TextEditingController controller;

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      textInputAction: TextInputAction.next,

      decoration: const InputDecoration(
        labelText: 'عنوان المعاملة',
        hintText: 'مثال: شراء بيتزا',

        prefixIcon: Icon(
          Icons.edit_note_rounded,
        ),
      ),

      // ==========================
      // Validation
      // ==========================

      validator: (value) {
        final text = value?.trim() ?? '';

        if (text.isEmpty) {
          return 'من فضلك أدخل عنوان المعاملة';
        }

        if (text.length < 3) {
          return 'العنوان يجب أن يكون 3 أحرف على الأقل';
        }

        if (text.length > 50) {
          return 'العنوان طويل جدًا';
        }

        return null;
      },
    );
  }
}