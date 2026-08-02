// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';
import 'package:masrofy/core/widgets/app_background.dart';

// ==========================
// About Screen
// ==========================

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // ==========================
          // Background
          // ==========================

          const AppBackground(),


          // ==========================
          // Screen Content
          // ==========================

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(
                AppSpacing.lg,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // Back Button

                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                  ),


                  const SizedBox(
                    height: AppSpacing.lg,
                  ),


                  // App Logo & Information

                  Center(
                    child: Column(
                      children: [

                        Image.asset(
                          'assets/images/logo.png',
                          width: 70,
                          height: 70,
                        ),


                        const SizedBox(
                          height: AppSpacing.lg,
                        ),


                        Text(
                          'Masrofy',

                          style: AppTextStyles
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: AppDarkColors.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),


                        const SizedBox(
                          height: AppSpacing.xs,
                        ),


                        Text(
                          'الإصدار 1.0.0',

                          style: AppTextStyles
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: AppDarkColors.textSecondary,
                              ),
                        ),
                      ],
                    ),
                  ),


                  const SizedBox(
                    height: 24,
                  ),


                  const Divider(),


                  const SizedBox(
                    height: 24,
                  ),


                  // App Description

                  Text(
                    'فكرة مصروفي',

                    style: AppTextStyles
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                          color: AppDarkColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),


                  const SizedBox(
                    height: AppSpacing.md,
                  ),


                  Text(
                    'مصروفي معمول علشان يساعدك تدير فلوسك بطريقة بسيطة ومنظمة، من غير تعقيد.\n\n'
                    'سواء كنت عايز تتابع دخلك، أو تعرف مصروفاتك، أو تحقق هدف ادخار، هتلاقي كل حاجة قدامك في مكان واحد.',

                    style: AppTextStyles
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                          color: AppDarkColors.textSecondary,
                          height: 1.7,
                        ),
                  ),


                  const SizedBox(
                    height: 24,
                  ),


                  // Features

                  _AboutFeatureCard(
                    icon: Icons.phone_android_rounded,
                    title: 'سهل الاستخدام',
                    description:
                        'واجهة بسيطة وسريعة تساعدك تتابع فلوسك بسهولة.',
                  ),


                  const SizedBox(
                    height: 16,
                  ),


                  _AboutFeatureCard(
                    icon: Icons.lock_rounded,
                    title: 'خصوصيتك أولاً',
                    description:
                        'كل بياناتك محفوظة على جهازك فقط.',
                  ),


                  const SizedBox(
                    height: 16,
                  ),


                  _AboutFeatureCard(
                    icon: Icons.flag_rounded,
                    title: 'حقق أهدافك',
                    description:
                        'تابع تقدمك في الادخار خطوة بخطوة.',
                  ),


                  const SizedBox(
                    height: 40,
                  ),


                  // Copyright

                  Center(
                    child: Text(
                      '© 2026 Emad Elfara',

                      style: AppTextStyles
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                            color: AppDarkColors.textSecondary,
                          ),
                    ),
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
// Private Widget
// ==========================

class _AboutFeatureCard extends StatelessWidget {
  const _AboutFeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

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
              color: AppDarkColors.primary.withValues(
                alpha: 0.15,
              ),

              shape: BoxShape.circle,
            ),


            child: Icon(
              icon,
              color: AppDarkColors.primary,
              size: 22,
            ),
          ),


          const SizedBox(
            width: 12,
          ),


          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  title,

                  style: AppTextStyles
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                        color: AppDarkColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),


                const SizedBox(
                  height: 4,
                ),


                Text(
                  description,

                  style: AppTextStyles
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                        color: AppDarkColors.textSecondary,
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