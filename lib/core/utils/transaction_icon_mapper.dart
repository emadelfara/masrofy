// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

// ============================================================
// Transaction Icon Mapper
// ============================================================

/// Maps transaction icon names to Flutter IconData.
class TransactionIconMapper {
  const TransactionIconMapper._();

  // ============================================================
  // Icon Mapping
  // ============================================================

  static final Map<String, IconData> _icons = {
    // ============================================================
    // Income
    // ============================================================

    'salary': Icons.payments_rounded,
    'income': Icons.account_balance_wallet_rounded,
    'bonus': Icons.workspace_premium_rounded,
    'investment': Icons.trending_up_rounded,
    'profit': Icons.attach_money_rounded,
    'business': Icons.business_center_rounded,
    'freelance': Icons.laptop_mac_rounded,
    'gift_income': Icons.card_giftcard_rounded,
    'refund': Icons.currency_exchange_rounded,

    // ============================================================
    // Shopping
    // ============================================================

    'shopping': Icons.shopping_cart_rounded,
    'clothes': Icons.checkroom_rounded,
    'shoes': Icons.hiking_rounded,
    'electronics': Icons.devices_rounded,
    'furniture': Icons.chair_alt_rounded,
    'market': Icons.store_rounded,
    'groceries': Icons.local_grocery_store_rounded,

    // ============================================================
    // Food
    // ============================================================

    'food': Icons.restaurant_rounded,
    'restaurant': Icons.restaurant_menu_rounded,
    'coffee': Icons.coffee_rounded,
    'bakery': Icons.bakery_dining_rounded,
    'fastfood': Icons.fastfood_rounded,
    'pizza': Icons.local_pizza_rounded,
    'icecream': Icons.icecream_rounded,

    // ============================================================
    // Transport
    // ============================================================

    'transport': Icons.directions_car_rounded,
    'fuel': Icons.local_gas_station_rounded,
    'taxi': Icons.local_taxi_rounded,
    'uber': Icons.local_taxi_rounded,
    'metro': Icons.train_rounded,
    'bus': Icons.directions_bus_rounded,
    'flight': Icons.flight_rounded,
    'parking': Icons.local_parking_rounded,
    'car': Icons.directions_car_filled_rounded,

    // ============================================================
    // Home
    // ============================================================

    'home': Icons.home_rounded,
    'rent': Icons.house_rounded,
    'electricity': Icons.electric_bolt_rounded,
    'water': Icons.water_drop_rounded,
    'gas': Icons.propane_tank_rounded,
    'internet': Icons.wifi_rounded,
    'maintenance': Icons.handyman_rounded,

    // ============================================================
    // Bills
    // ============================================================

    'bill': Icons.receipt_long_rounded,
    'phone': Icons.phone_android_rounded,
    'subscription': Icons.subscriptions_rounded,

    // ============================================================
    // Health
    // ============================================================

    'health': Icons.local_hospital_rounded,
    'doctor': Icons.medical_services_rounded,
    'medicine': Icons.medication_rounded,
    'hospital': Icons.local_hospital_rounded,
    'dental': Icons.health_and_safety_rounded,
    'glasses': Icons.visibility_rounded,

    // ============================================================
    // Education
    // ============================================================

    'education': Icons.school_rounded,
    'course': Icons.menu_book_rounded,
    'book': Icons.book_rounded,
    'university': Icons.account_balance_rounded,

    // ============================================================
    // Entertainment
    // ============================================================

    'entertainment': Icons.movie_rounded,
    'cinema': Icons.local_movies_rounded,
    'games': Icons.sports_esports_rounded,
    'music': Icons.music_note_rounded,
    'travel': Icons.beach_access_rounded,

    // ============================================================
    // Family
    // ============================================================

    'family': Icons.family_restroom_rounded,
    'kids': Icons.child_care_rounded,
    'baby': Icons.baby_changing_station_rounded,

    // ============================================================
    // Pets
    // ============================================================

    'pets': Icons.pets_rounded,
    'vet': Icons.pets_rounded,

    // ============================================================
    // Gifts
    // ============================================================

    'gift': Icons.card_giftcard_rounded,
    'charity': Icons.favorite_rounded,

    // ============================================================
    // Religion
    // ============================================================

    'zakat': Icons.volunteer_activism_rounded,
    'donation': Icons.volunteer_activism_rounded,

    // ============================================================
    // Work
    // ============================================================

    'work': Icons.work_rounded,
    'office': Icons.apartment_rounded,
    'software': Icons.computer_rounded,

    // ============================================================
    // Bank
    // ============================================================

    'bank': Icons.account_balance_rounded,
    'card': Icons.credit_card_rounded,
    'atm': Icons.atm_rounded,

    // ============================================================
    // Others
    // ============================================================

    'tax': Icons.request_quote_rounded,
    'government': Icons.gavel_rounded,
    'other': Icons.category_rounded,
  };

  // ============================================================
  // Public Methods
  // ============================================================

  /// Returns the matching icon for the given key.
  static IconData getIcon(String key) {
    return _icons[key.toLowerCase()] ?? Icons.receipt_long_rounded;
  }
}