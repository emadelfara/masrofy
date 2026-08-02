// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/features/onboarding/data/models/onboarding_item.dart';

// ============================================================
// Onboarding Page
// ============================================================

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    super.key,
    required this.item,
  });

  // ============================================================
  // Properties
  // ============================================================

  final OnboardingItem item;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

// ============================================================
// Onboarding Page State
// ============================================================

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  // ============================================================
  // Animations
  // ============================================================

  late final AnimationController _controller;

  late final Animation<double> _fadeAnimation;

  late final Animation<Offset> _slideAnimation;

  // ============================================================
  // Lifecycle
  // ============================================================

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0.15),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
          ),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: SvgPicture.asset(
                  widget.item.image,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 32,
          ),

          FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              widget.item.title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              widget.item.description,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(
                    color: AppDarkColors.textSecondary,
                    height: 1.6,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}