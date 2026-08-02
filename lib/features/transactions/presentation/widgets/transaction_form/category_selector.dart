// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/models/category_model.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

import 'add_category_dialog.dart';

// ============================================================
// Category Selector
// ============================================================

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onChanged,
    this.errorText,
  });

  // ============================================================
  // Properties
  // ============================================================

  final List<CategoryModel> categories;

  final CategoryModel? selectedCategory;

  final ValueChanged<CategoryModel?> onChanged;

  final String? errorText;

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // ============================================================
        // Label
        // ============================================================

        Text(
          'الفئة',

          style: AppTextStyles.textTheme.titleMedium?.copyWith(
            color: AppDarkColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: AppSpacing.md,
        ),

        // ============================================================
        // Category Dropdown
        // ============================================================

        DropdownButtonFormField<CategoryModel>(
          decoration: InputDecoration(
            errorText: errorText,

            hintText: 'اختر الفئة',

            prefixIcon: const Icon(
              Icons.category_rounded,
            ),

            filled: true,

            fillColor: AppDarkColors.surface,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.lg,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.lg,
              ),

              borderSide: const BorderSide(
                color: AppDarkColors.border,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.lg,
              ),

              borderSide: const BorderSide(
                color: AppDarkColors.primary,
                width: 2,
              ),
            ),
          ),

          items: categories.map(
            (category) {
              return DropdownMenuItem<CategoryModel>(
                value: category,

                child: Row(
                  children: [
                    Icon(
                      category.icon,
                      size: 20,
                    ),

                    const SizedBox(
                      width: 10,
                    ),

                    Text(
                      category.name,
                    ),
                  ],
                ),
              );
            },
          ).toList(),

          // ============================================================
          // Selected Category
          // ============================================================

          initialValue: selectedCategory == null
              ? null
              : categories
                      .where(
                        (e) =>
                            e.id ==
                            selectedCategory!.id,
                      )
                      .isNotEmpty
                  ? categories.firstWhere(
                      (e) =>
                          e.id ==
                          selectedCategory!.id,
                    )
                  : null,

          onChanged: onChanged,
        ),

        const SizedBox(
          height: AppSpacing.sm,
        ),

        // ============================================================
        // Add New Category Button
        // ============================================================

        Align(
          alignment: Alignment.centerRight,

          child: InkWell(
            borderRadius: BorderRadius.circular(
              AppRadius.md,
            ),

            onTap: () {
              showDialog(
                context: context,

                builder: (_) =>
                    const AddCategoryDialog(),
              );
            },

            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 4,
              ),

              child: Row(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Icon(
                    Icons.add_circle_outline_rounded,

                    color: AppDarkColors.primary,

                    size: 20,
                  ),

                  const SizedBox(
                    width: 6,
                  ),

                  Text(
                    'إضافة فئة جديدة',

                    style: AppTextStyles.textTheme.bodyMedium
                        ?.copyWith(
                      color: AppDarkColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}