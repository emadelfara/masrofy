// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/features/transactions/presentation/screens/transaction_form_screen.dart';

import 'quick_action_model.dart';

// ============================================================
// Quick Actions Items
// ============================================================

final List<QuickActionModel> quickActions = [
  QuickActionModel(
    title: 'إضافة معاملة',
    icon: Icons.add_circle_outline_rounded,
    showAddBadge: false,
    onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const TransactionFormScreen(),
        ),
      );
    },
  ),
];