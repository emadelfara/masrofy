// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/app/app_shell.dart';
import 'package:masrofy/core/repositories/user_settings_repository.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/widgets/app_background.dart';

// ============================================================
// Nickname Screen
// ============================================================

class NicknameScreen extends StatefulWidget {
  const NicknameScreen({super.key});

  @override
  State<NicknameScreen> createState() => _NicknameScreenState();
}

// ============================================================
// Nickname Screen State
// ============================================================

class _NicknameScreenState extends State<NicknameScreen> {
  // ============================================================
  // Controllers
  // ============================================================

  late final TextEditingController _nicknameController;

  // ============================================================
  // State
  // ============================================================

  bool _isButtonEnabled = false;

  final UserSettingsRepository _repository =
      UserSettingsRepository();

  // ============================================================
  // Lifecycle
  // ============================================================

  @override
  void initState() {
    super.initState();

    _nicknameController = TextEditingController();

    _nicknameController.addListener(_checkNickname);
  }

  @override
  void dispose() {
    _nicknameController.dispose();

    super.dispose();
  }

  // ============================================================
  // Check Nickname
  // ============================================================

  void _checkNickname() {
    final nickname = _nicknameController.text.trim();

    final hasNumber = RegExp(r'\d').hasMatch(nickname);

    setState(() {
      _isButtonEnabled = nickname.length >= 3 && !hasNumber;
    });
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
          // Background
          // ============================================================

          const AppBackground(),

          // ============================================================
          // Screen Content
          // ============================================================

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),

                  // ============================================================
                  // Welcome Icon
                  // ============================================================

                  const Icon(
                    Icons.waving_hand_rounded,
                    size: 70,
                    color: AppDarkColors.secondary,
                  ),

                  const SizedBox(height: 24),

                  // ============================================================
                  // Screen Title
                  // ============================================================

                  Text(
                    'أهلًا بك 👋',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge,
                  ),

                  const SizedBox(height: 16),

                  // ============================================================
                  // Screen Description
                  // ============================================================

                  Text(
                    'اختر اسمًا مستعارًا يظهر داخل التطبيق.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                          color: AppDarkColors.textSecondary,
                        ),
                  ),

                  const SizedBox(height: 40),

                  // ============================================================
                  // Nickname TextField
                  // ============================================================

                  TextField(
                    controller: _nicknameController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'اكتب اسمك هنا',
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ============================================================
                  // Small Note
                  // ============================================================

                  Text(
                    'لن يتم مشاركة هذا الاسم مع أي شخص.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                          color: AppDarkColors.textSecondary,
                        ),
                  ),

                  const Spacer(),

                  // ============================================================
                  // Continue Button
                  // ============================================================

                  ElevatedButton(
                    onPressed: _isButtonEnabled
                        ? () async {
                            await _repository.saveUserSettings(
                              nickname:
                                  _nicknameController.text.trim(),
                              onboardingCompleted: true,
                            );

                            if (!context.mounted) return;

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AppShell(),
                              ),
                            );
                          }
                        : null,
                    child: const Text('متابعة'),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}