// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/providers/user_settings_provider.dart';
import 'package:masrofy/core/widgets/app_background.dart';
import 'package:masrofy/core/constants/app_spacing.dart';

import '../widgets/settings_header.dart';
import '../widgets/settings_list_tile.dart';
import '../widgets/settings_section.dart';

import 'about_screen.dart';
import 'developer_screen.dart';

// ==========================
// Settings Screen
// ==========================

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userSettingsAsync = ref.watch(
      userSettingsProvider,
    );

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
              padding: const EdgeInsets.all(AppSpacing.lg),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // Header

                  const SettingsHeader(),


                  const SizedBox(
                    height: 32,
                  ),


                  // ==========================
                  // Account Section
                  // ==========================

                  SettingsSection(
                    title: 'الحساب',

                    children: [

                      userSettingsAsync.when(

                        // Loading State

                        loading: () => const SettingsListTile(
                          icon: Icons.person_outline_rounded,
                          title: 'تعديل الاسم',
                          subtitle: 'جارٍ التحميل...',
                        ),


                        // Error State

                        error: (_, _) => SettingsListTile(
                          icon: Icons.person_outline_rounded,
                          title: 'تعديل الاسم',
                          subtitle: 'حدث خطأ',
                          onTap: () {},
                        ),


                        // Data State

                        data: (user) => SettingsListTile(
                          icon: Icons.person_outline_rounded,
                          title: 'تعديل الاسم',
                          subtitle: user?.nickname ?? 'بدون اسم',

                          onTap: () async {

                            final controller = TextEditingController(
                              text: user?.nickname ?? '',
                            );


                            final result = await showDialog<String>(
                              context: context,

                              builder: (context) {

                                return AlertDialog(

                                  title: const Text(
                                    'تعديل الاسم',
                                  ),


                                  content: TextField(
                                    controller: controller,
                                    autofocus: true,
                                    maxLength: 25,

                                    decoration: const InputDecoration(
                                      hintText: 'اكتب اسمك',
                                    ),
                                  ),


                                  actions: [

                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },

                                      child: const Text(
                                        'إلغاء',
                                      ),
                                    ),


                                    FilledButton(
                                      onPressed: () {

                                        Navigator.pop(
                                          context,
                                          controller.text.trim(),
                                        );

                                      },

                                      child: const Text(
                                        'حفظ',
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );


                            if (result == null || result.isEmpty) {
                              return;
                            }


                            await ref
                                .read(
                                  userSettingsNotifierProvider,
                                )
                                .updateNickname(result);
                          },
                        ),
                      ),
                    ],
                  ),


                  const SizedBox(
                    height: 24,
                  ),


                  // ==========================
                  // App Information Section
                  // ==========================

                  SettingsSection(
                    title: 'حول التطبيق',

                    children: [

                      SettingsListTile(
                        icon: Icons.info_outline_rounded,
                        title: 'عن التطبيق',

                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AboutScreen(),
                            ),
                          );

                        },
                      ),


                      const Divider(
                        height: 1,
                        indent: 56,
                      ),


                      const SettingsListTile(
                        icon: Icons.verified_outlined,
                        title: 'الإصدار',
                        trailing: Text('1.0.0'),
                      ),


                      const Divider(
                        height: 1,
                      ),


                      SettingsListTile(
                        icon: Icons.code_rounded,
                        title: 'المطور',
                        subtitle: 'Emad Elfara',

                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const DeveloperScreen(),
                            ),
                          );

                        },
                      ),
                    ],
                  ),


                  const SizedBox(
                    height: 32,
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