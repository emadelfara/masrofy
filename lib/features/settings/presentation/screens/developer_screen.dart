// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';
import 'package:masrofy/core/utils/native_launcher.dart';
import 'package:masrofy/core/widgets/app_background.dart';

// ==========================
// Class
// ==========================

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppBackground(),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.md),

                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppDarkColors.primary,
                              width: 3,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/profile.jpg',
                              ),
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.md),

                        Text(
                          'Emad Elfara',
                          style: AppTextStyles.textTheme.headlineSmall
                              ?.copyWith(
                                color: AppDarkColors.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),

                        const SizedBox(height: AppSpacing.xs),

                        Text(
                          'مطور تطبيق مصروفي',
                          style: AppTextStyles.textTheme.bodyMedium?.copyWith(
                            color: AppDarkColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  const Divider(),

                  const SizedBox(height: AppSpacing.lg),

                  Text(
                    'شكراً لاستخدامك مصروفي ❤️',
                    style: AppTextStyles.textTheme.titleLarge?.copyWith(
                      color: AppDarkColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.sm),

                  Text(
                    'لو عندك أي اقتراح، أو لقيت مشكلة في التطبيق، '
                    'أو حتى حابب تتواصل معايا، هيسعدني جداً أسمع منك.',
                    style: AppTextStyles.textTheme.bodyLarge?.copyWith(
                      color: AppDarkColors.textSecondary,
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  _contactCard(
                    icon: Icons.email_outlined,
                    title: 'البريد الإلكتروني',
                    subtitle: 'emadelfara90@gmail.com',
                    onTap: () async {
                      await NativeLauncher.openUrl(
                        'mailto:emadelfara90@gmail.com',
                      );
                    },
                  ),

                  _contactCard(
                    icon: Icons.code_rounded,
                    title: 'GitHub',
                    subtitle: 'github.com/emadelfara',
                    onTap: () async {
                      await NativeLauncher.openUrl(
                        'https://github.com/emadelfara',
                      );
                    },
                  ),

                  _contactCard(
                    icon: Icons.work_outline_rounded,
                    title: 'LinkedIn',
                    subtitle: 'linkedin.com/in/emad-elfara',
                    onTap: () async {
                      await NativeLauncher.openUrl(
                        'https://www.linkedin.com/in/emad-elfara-3a1b30245/',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================
// Helper Methods
// ==========================

Widget _contactCard({
  required IconData icon,
  required String title,
  required String subtitle,
  VoidCallback? onTap,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppDarkColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppDarkColors.border,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppDarkColors.primary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppDarkColors.primary,
              size: 22,
            ),
          ),

          const SizedBox(width: AppSpacing.md),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.textTheme.titleMedium?.copyWith(
                    color: AppDarkColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: AppSpacing.xs),

                Text(
                  subtitle,
                  style: AppTextStyles.textTheme.bodyMedium?.copyWith(
                    color: AppDarkColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}