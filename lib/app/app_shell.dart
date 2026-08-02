// -----------------------------------------------------------------------------
// Flutter Imports
// -----------------------------------------------------------------------------

import 'package:flutter/material.dart';

// -----------------------------------------------------------------------------
// Project Imports
// -----------------------------------------------------------------------------

import 'package:masrofy/features/goals/presentation/screens/goals_screen.dart';
import 'package:masrofy/features/home/presentation/screens/home_screen.dart';
import 'package:masrofy/features/home/presentation/widgets/home_bottom_navigation.dart';
import 'package:masrofy/features/settings/presentation/screens/settings_screen.dart';
import 'package:masrofy/features/stats/presentation/screens/stats_screen.dart';
import 'package:masrofy/features/transactions/presentation/screens/transactions_screen.dart';

// -----------------------------------------------------------------------------
// App Shell Widget
// -----------------------------------------------------------------------------

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

// -----------------------------------------------------------------------------
// App Shell State
// -----------------------------------------------------------------------------

class _AppShellState extends State<AppShell> {

  // ---------------------------------------------------------------------------
  // Variables
  // ---------------------------------------------------------------------------

  int _currentIndex = 0;

  // ---------------------------------------------------------------------------
  // App Pages
  // ---------------------------------------------------------------------------

  late final List<Widget> _pages = [
    HomeScreen(
      onOpenTransactions: () {
        _onTabChanged(1);
      },
    ),
    const TransactionsScreen(),
    const StatsScreen(),
    const GoalsScreen(),
    const SettingsScreen(),
  ];

  // ---------------------------------------------------------------------------
  // Navigation Methods
  // ---------------------------------------------------------------------------

  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // ---------------------------------------------------------------------------
  // Build Method
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      bottomNavigationBar: HomeBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onTabChanged,
      ),
    );
  }
}