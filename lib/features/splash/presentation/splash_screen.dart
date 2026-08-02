// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/app/app_shell.dart';
import 'package:masrofy/core/repositories/user_settings_repository.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/widgets/app_background.dart';
import 'package:masrofy/features/onboarding/presentation/screens/onboarding_screen.dart';

// ============================================================
// Splash Screen
// ============================================================

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _logoScale;
  late final Animation<double> _logoOpacity;
  late final Animation<Offset> _logoOffset;

  late final Animation<double> _titleOpacity;
  late final Animation<Offset> _titleOffset;

  late final Animation<double> _sloganOpacity;
  late final Animation<Offset> _sloganOffset;

  late final Animation<double> _loadingOpacity;

  final UserSettingsRepository _repository =
      UserSettingsRepository();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // ============================================================
    // Animation Logo
    // ============================================================

    _logoScale =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween(
              begin: 0.65,
              end: 1.08,
            ).chain(
              CurveTween(
                curve: Curves.easeOut,
              ),
            ),
            weight: 80,
          ),
          TweenSequenceItem(
            tween: Tween(
              begin: 1.08,
              end: 1.0,
            ).chain(
              CurveTween(
                curve: Curves.easeOut,
              ),
            ),
            weight: 20,
          ),
        ]).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.45),
          ),
        );

    _logoOpacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.35),
      ),
    );

    _logoOffset =
        Tween<Offset>(
          begin: const Offset(0, .25),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(
              0.0,
              0.45,
              curve: Curves.easeOut,
            ),
          ),
        );

    // ============================================================
    // Animation Title
    // ============================================================

    _titleOpacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.65),
      ),
    );

    _titleOffset =
        Tween<Offset>(
          begin: const Offset(0, .20),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(
              0.35,
              0.65,
              curve: Curves.easeOut,
            ),
          ),
        );

    // ============================================================
    // Animation Slogan
    // ============================================================

    _sloganOpacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 0.80),
      ),
    );

    _sloganOffset =
        Tween<Offset>(
          begin: const Offset(0, .20),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(
              0.55,
              0.80,
              curve: Curves.easeOut,
            ),
          ),
        );

    // ============================================================
    // Animation Loading
    // ============================================================

    _loadingOpacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.80, 1.0),
      ),
    );

    _startSplashFlow();
  }

  Future<void> _startSplashFlow() async {
    await _controller.forward();

    await Future.delayed(
      const Duration(milliseconds: 2000),
    );

    final settings = await _repository.getUserSettings();

    if (!mounted) return;

    if (settings != null && settings.onboardingCompleted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const AppShell(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppBackground(),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ============================================================
                // Logo
                // ============================================================

                SlideTransition(
                  position: _logoOffset,
                  child: FadeTransition(
                    opacity: _logoOpacity,
                    child: ScaleTransition(
                      scale: _logoScale,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(
                                alpha: 0.35,
                              ),
                              blurRadius: 35,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 170,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ============================================================
                // App Name
                // ============================================================

                SlideTransition(
                  position: _titleOffset,
                  child: FadeTransition(
                    opacity: _titleOpacity,
                    child: Text(
                      'مصروفي',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                            fontSize: 40,
                          ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // ============================================================
                // Slogan
                // ============================================================

                SlideTransition(
                  position: _sloganOffset,
                  child: FadeTransition(
                    opacity: _sloganOpacity,
                    child: Text(
                      'مصاريفك كلها في إيدك',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                            color: AppDarkColors.textSecondary,
                            fontSize: 20,
                          ),
                    ),
                  ),
                ),

                const SizedBox(height: 56),

                // ============================================================
                // Loading
                // ============================================================

                FadeTransition(
                  opacity: _loadingOpacity,
                  child: const SizedBox(
                    width: 34,
                    height: 34,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}