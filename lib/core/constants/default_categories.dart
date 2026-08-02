// -----------------------------------------------------------------------------
// Flutter Imports
// -----------------------------------------------------------------------------

import 'package:flutter/material.dart';

// -----------------------------------------------------------------------------
// Default Category Model
// -----------------------------------------------------------------------------

class DefaultCategory {
  final String name;
  final String iconName;
  final Color color;
  final String type;

  const DefaultCategory({
    required this.name,
    required this.iconName,
    required this.color,
    required this.type,
  });
}

// -----------------------------------------------------------------------------
// Default Categories Configuration
// -----------------------------------------------------------------------------

abstract final class DefaultCategories {
  DefaultCategories._();

  // ---------------------------------------------------------------------------
  // All Default Categories
  // ---------------------------------------------------------------------------

  static const List<DefaultCategory> all = [
    // -------------------------------------------------------------------------
    // Income Categories
    // -------------------------------------------------------------------------

    DefaultCategory(
      name: 'راتب',
      iconName: 'work_rounded',
      color: Colors.green,
      type: 'income',
    ),

    DefaultCategory(
      name: 'عمل حر',
      iconName: 'laptop_mac_rounded',
      color: Colors.teal,
      type: 'income',
    ),

    DefaultCategory(
      name: 'استثمار',
      iconName: 'trending_up_rounded',
      color: Colors.green,
      type: 'income',
    ),

    DefaultCategory(
      name: 'مكافأة',
      iconName: 'workspace_premium_rounded',
      color: Colors.amber,
      type: 'income',
    ),

    DefaultCategory(
      name: 'هدية',
      iconName: 'card_giftcard_rounded',
      color: Colors.pink,
      type: 'income',
    ),

    DefaultCategory(
      name: 'أرباح',
      iconName: 'account_balance_wallet_rounded',
      color: Colors.green,
      type: 'income',
    ),

    DefaultCategory(
      name: 'بيع',
      iconName: 'sell_rounded',
      color: Colors.blue,
      type: 'income',
    ),

    DefaultCategory(
      name: 'دخل إضافي',
      iconName: 'attach_money_rounded',
      color: Colors.lightGreen,
      type: 'income',
    ),

    // -------------------------------------------------------------------------
    // Expense Categories
    // -------------------------------------------------------------------------

    DefaultCategory(
      name: 'طعام',
      iconName: 'restaurant_rounded',
      color: Colors.orange,
      type: 'expense',
    ),

    DefaultCategory(
      name: 'تسوق',
      iconName: 'shopping_bag_rounded',
      color: Colors.deepPurple,
      type: 'expense',
    ),

    DefaultCategory(
      name: 'مواصلات',
      iconName: 'directions_car_rounded',
      color: Colors.blue,
      type: 'expense',
    ),

    DefaultCategory(
      name: 'المنزل',
      iconName: 'home_rounded',
      color: Colors.brown,
      type: 'expense',
    ),

    DefaultCategory(
      name: 'الصحة',
      iconName: 'favorite_rounded',
      color: Colors.red,
      type: 'expense',
    ),

    DefaultCategory(
      name: 'التعليم',
      iconName: 'school_rounded',
      color: Colors.indigo,
      type: 'expense',
    ),

    DefaultCategory(
      name: 'الترفيه',
      iconName: 'sports_esports_rounded',
      color: Colors.purple,
      type: 'expense',
    ),

    DefaultCategory(
      name: 'الاتصالات',
      iconName: 'phone_android_rounded',
      color: Colors.cyan,
      type: 'expense',
    ),

    DefaultCategory(
      name: 'الفواتير',
      iconName: 'receipt_long_rounded',
      color: Colors.deepOrange,
      type: 'expense',
    ),

    DefaultCategory(
      name: 'الاشتراكات',
      iconName: 'subscriptions_rounded',
      color: Colors.blueGrey,
      type: 'expense',
    ),

    DefaultCategory(
      name: 'أخرى',
      iconName: 'more_horiz_rounded',
      color: Colors.grey,
      type: 'expense',
    ),
  ];
}