// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/formatters/currency_formatter.dart';
import 'package:masrofy/core/providers/top_categories_provider.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';
import 'package:masrofy/core/widgets/app_progress_bar.dart';

// ==========================
// Top Categories Card
// ==========================

class TopCategoriesCard extends ConsumerWidget {
  const TopCategoriesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(topCategoriesProvider);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppDarkColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: AppDarkColors.border,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          // ==========================
          // Header
          // ==========================

          Row(
            children: [
              const Icon(
                Icons.pie_chart_rounded,
                color: AppDarkColors.primary,
              ),

              const SizedBox(
                width: AppSpacing.sm,
              ),

              Text(
                'أعلى فئات الإنفاق',
                style: AppTextStyles.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppDarkColors.textPrimary,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.xl,
          ),


          // ==========================
          // Categories Data State
          // ==========================

          categoriesAsync.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),

            error: (_, _) => const Center(
              child: Text(
                'حدث خطأ أثناء تحميل البيانات',
              ),
            ),

            data: (categories) {

              if (categories.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  child: Center(
                    child: Text(
                      'لا توجد بيانات لعرضها',
                    ),
                  ),
                );
              }


              return Column(
                children: List.generate(
                  categories.length,
                  (index) {

                    final item = categories[index];

                    final visual = _categoryVisual(
                      item.title,
                    );


                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index == categories.length - 1
                            ? 0
                            : AppSpacing.lg,
                      ),

                      child: _CategoryTile(
                        icon: visual.icon,
                        iconColor: visual.color,
                        title: item.title,
                        amount: item.amount,
                        progress: item.progress,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


// ==========================
// Category Tile
// ==========================

class _CategoryTile extends StatelessWidget {

  const _CategoryTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.amount,
    required this.progress,
  });


  final IconData icon;
  final Color iconColor;
  final String title;
  final double amount;
  final double progress;


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        // Category Information

        Row(
          children: [

            CircleAvatar(
              radius: 18,
              backgroundColor: iconColor.withValues(
                alpha: 0.15,
              ),

              child: Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
            ),


            const SizedBox(
              width: AppSpacing.sm,
            ),


            Expanded(
              child: Text(
                title,
                style: AppTextStyles.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppDarkColors.textPrimary,
                ),
              ),
            ),


            Text(
              CurrencyFormatter.format(amount),
              style: AppTextStyles.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppDarkColors.textPrimary,
              ),
            ),
          ],
        ),


        const SizedBox(
          height: AppSpacing.md,
        ),


        // Progress

        Row(
          children: [

            Expanded(
              child: AppProgressBar(
                value: progress,
              ),
            ),


            const SizedBox(
              width: AppSpacing.sm,
            ),


            Text(
              '${(progress * 100).toInt()}%',
              style: AppTextStyles.textTheme.bodySmall?.copyWith(
                color: AppDarkColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}


// ==========================
// Category Visual Model
// ==========================

class _CategoryVisual {

  final IconData icon;
  final Color color;


  const _CategoryVisual({
    required this.icon,
    required this.color,
  });
}


// ==========================
// Category Visual Mapper
// ==========================

_CategoryVisual _categoryVisual(
  String title,
) {

  switch (title) {

    case 'الطعام':
      return const _CategoryVisual(
        icon: Icons.restaurant_rounded,
        color: Colors.orange,
      );


    case 'المواصلات':
      return const _CategoryVisual(
        icon: Icons.directions_car_rounded,
        color: Colors.blue,
      );


    case 'التسوق':
      return const _CategoryVisual(
        icon: Icons.shopping_bag_rounded,
        color: Colors.purple,
      );


    case 'الفواتير':
      return const _CategoryVisual(
        icon: Icons.receipt_long_rounded,
        color: Colors.red,
      );


    case 'الصحة':
      return const _CategoryVisual(
        icon: Icons.health_and_safety_rounded,
        color: Colors.green,
      );


    case 'الترفيه':
      return const _CategoryVisual(
        icon: Icons.sports_esports_rounded,
        color: Colors.pink,
      );


    case 'التعليم':
      return const _CategoryVisual(
        icon: Icons.school_rounded,
        color: Colors.indigo,
      );


    default:
      return const _CategoryVisual(
        icon: Icons.category_rounded,
        color: Colors.grey,
      );
  }
}