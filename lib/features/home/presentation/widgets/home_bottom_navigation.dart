// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

// ============================================================
// Home Bottom Navigation
// ============================================================

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  // ============================================================
  // Properties
  // ============================================================

  final int currentIndex;

  final ValueChanged<int> onTap;

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,

      onDestinationSelected: onTap,

      destinations: const [
        // ============================================================
        // Home
        // ============================================================

        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'الرئيسية',
        ),

        // ============================================================
        // Transactions
        // ============================================================

        NavigationDestination(
          icon: Icon(Icons.swap_horiz_outlined),
          selectedIcon: Icon(Icons.swap_horiz),
          label: 'المعاملات',
        ),

        // ============================================================
        // Statistics
        // ============================================================

        NavigationDestination(
          icon: Icon(Icons.bar_chart_outlined),
          selectedIcon: Icon(Icons.bar_chart),
          label: 'الإحصائيات',
        ),

        // ============================================================
        // Goals
        // ============================================================

        NavigationDestination(
          icon: Icon(Icons.savings_outlined),
          selectedIcon: Icon(Icons.savings),
          label: 'الأهداف',
        ),

        // ============================================================
        // Settings
        // ============================================================

        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: 'الإعدادات',
        ),
      ],
    );
  }
}