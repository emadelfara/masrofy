// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/widgets/app_background.dart';
import 'package:masrofy/features/nickname/nickname_screen.dart';
import 'package:masrofy/features/onboarding/data/models/onboarding_item.dart';
import 'package:masrofy/features/onboarding/presentation/widgets/onboarding_page.dart';

// ============================================================
// Onboarding Screen
// ============================================================

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

// ============================================================
// Onboarding Screen State
// ============================================================

class _OnboardingScreenState extends State<OnboardingScreen> {
  // ============================================================
  // Page Controller
  // ============================================================

  late final PageController _pageController;

  // ============================================================
  // Current Page
  // ============================================================

  int _currentPage = 0;

  // ============================================================
  // Onboarding Pages Data
  // ============================================================

  final List<OnboardingItem> _pages = [
    const OnboardingItem(
      image: 'assets/images/illustrations/onboarding_welcome.svg',
      title: 'مرحبًا بك في مصروفي',
      description:
          'سجّل دخلك ومصاريفك بسهولة، واحتفظ بكل معاملاتك في مكان واحد.',
    ),
    const OnboardingItem(
      image: 'assets/images/illustrations/onboarding_analytics.svg',
      title: 'تابع مصاريفك بوضوح',
      description:
          'شاهد تقارير وإحصائيات تساعدك على فهم إنفاقك واتخاذ قرارات أفضل.',
    ),
    const OnboardingItem(
      image: 'assets/images/illustrations/onboarding_goals.svg',
      title: 'تحكم في أموالك وحقق أهدافك',
      description:
          'كل عملية تسجلها تقربك خطوة نحو إدارة أموالك بشكل أفضل.',
    ),
  ];

  // ============================================================
  // Lifecycle
  // ============================================================

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  // ============================================================
  // Go To Next Page
  // ============================================================

  void _nextPage() {
    if (_currentPage == _pages.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const NicknameScreen(),
        ),
      );

      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  // ============================================================
  // Skip To Last Page
  // ============================================================

  void _skipToLastPage() {
    _pageController.animateToPage(
      _pages.length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ============================================================
          // Shared Background
          // ============================================================

          const AppBackground(),

          // ============================================================
          // Screen Content
          // ============================================================

          SafeArea(
            child: Column(
              children: [
                // ============================================================
                // Onboarding Pages
                // ============================================================

                Expanded(
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    controller: _pageController,
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return OnboardingPage(
                        item: _pages[index],
                      );
                    },
                  ),
                ),

                // ============================================================
                // Page Indicator
                // ============================================================

                const SizedBox(height: 24),

                SmoothPageIndicator(
                  controller: _pageController,
                  count: _pages.length,
                  effect: WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 12,
                    activeDotColor: AppDarkColors.secondary,
                    dotColor: Colors.white24,
                  ),
                ),

                // ============================================================
                // Navigation Buttons
                // ============================================================

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: _currentPage == _pages.length - 1
                      ? SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _nextPage,
                            child: const Text('ابدأ'),
                          ),
                        )
                      : Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: _skipToLastPage,
                              child: const Text('تخطي'),
                            ),
                            ElevatedButton(
                              onPressed: _nextPage,
                              child: const Text('التالي'),
                            ),
                          ],
                        ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}