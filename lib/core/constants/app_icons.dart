// -----------------------------------------------------------------------------
// Flutter Imports
// -----------------------------------------------------------------------------

import 'package:flutter/material.dart';

// -----------------------------------------------------------------------------
// Icon Configuration
// -----------------------------------------------------------------------------

abstract final class AppIcons {
  AppIcons._();

  // ---------------------------------------------------------------------------
  // Navigation Icons
  // ---------------------------------------------------------------------------

  static const home = Icons.home_rounded;
  static const transactions = Icons.receipt_long_rounded;
  static const statistics = Icons.bar_chart_rounded;
  static const goals = Icons.flag_rounded;
  static const settings = Icons.settings_rounded;

  // ---------------------------------------------------------------------------
  // Action Icons
  // ---------------------------------------------------------------------------

  static const add = Icons.add_rounded;
  static const edit = Icons.edit_rounded;
  static const delete = Icons.delete_rounded;
  static const save = Icons.check_rounded;
  static const search = Icons.search_rounded;
  static const close = Icons.close_rounded;
  static const back = Icons.arrow_back_rounded;

  // ---------------------------------------------------------------------------
  // Status Icons
  // ---------------------------------------------------------------------------

  static const success = Icons.check_circle_rounded;
  static const warning = Icons.warning_amber_rounded;
  static const error = Icons.error_rounded;
  static const info = Icons.info_rounded;
  static const empty = Icons.inbox_rounded;

  // ---------------------------------------------------------------------------
  // Category Icons
  // ---------------------------------------------------------------------------

  static const Map<String, IconData> categoryIcons = {
    'work_rounded': Icons.work_rounded,
    'laptop_mac_rounded': Icons.laptop_mac_rounded,
    'trending_up_rounded': Icons.trending_up_rounded,
    'workspace_premium_rounded': Icons.workspace_premium_rounded,
    'card_giftcard_rounded': Icons.card_giftcard_rounded,
    'account_balance_wallet_rounded': Icons.account_balance_wallet_rounded,
    'sell_rounded': Icons.sell_rounded,
    'attach_money_rounded': Icons.attach_money_rounded,

    'restaurant_rounded': Icons.restaurant_rounded,
    'shopping_bag_rounded': Icons.shopping_bag_rounded,
    'directions_car_rounded': Icons.directions_car_rounded,
    'home_rounded': Icons.home_rounded,
    'favorite_rounded': Icons.favorite_rounded,
    'school_rounded': Icons.school_rounded,
    'sports_esports_rounded': Icons.sports_esports_rounded,
    'phone_android_rounded': Icons.phone_android_rounded,
    'receipt_long_rounded': Icons.receipt_long_rounded,
    'subscriptions_rounded': Icons.subscriptions_rounded,
    'more_horiz_rounded': Icons.more_horiz_rounded,

    'local_hospital_rounded': Icons.local_hospital_rounded,
    'flight_rounded': Icons.flight_rounded,
  };

  static const List<String> selectableCategoryIcons = [
    'restaurant_rounded',
    'shopping_bag_rounded',
    'directions_car_rounded',
    'home_rounded',
    'school_rounded',
    'favorite_rounded',
    'sports_esports_rounded',
    'work_rounded',
    'local_hospital_rounded',
    'flight_rounded',
    'phone_android_rounded',
    'card_giftcard_rounded',
  ];

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  static IconData getCategoryIcon(String iconName) {
    return categoryIcons[iconName] ?? Icons.category_rounded;
  }
}