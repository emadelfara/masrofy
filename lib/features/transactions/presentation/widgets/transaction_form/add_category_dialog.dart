// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/constants/app_icons.dart';
import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/database/app_database.dart';
import 'package:masrofy/core/providers/category_provider.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// ============================================================
// Add Category Dialog
// ============================================================

class AddCategoryDialog extends ConsumerStatefulWidget {
  const AddCategoryDialog({
    super.key,
  });

  @override
  ConsumerState<AddCategoryDialog> createState() =>
      _AddCategoryDialogState();
}

// ============================================================
// State
// ============================================================

class _AddCategoryDialogState
    extends ConsumerState<AddCategoryDialog> {
  // ============================================================
  // Controllers
  // ============================================================

  final TextEditingController _nameController =
      TextEditingController();

  // ============================================================
  // State Variables
  // ============================================================

  bool _isIncome = false;

  String? _selectedIconName;

  final List<String> _icons =
      AppIcons.selectableCategoryIcons;

  // ============================================================
  // Dispose
  // ============================================================

  @override
  void dispose() {
    _nameController.dispose();

    super.dispose();
  }

  // ============================================================
  // Save Category
  // ============================================================

  Future<void> _saveCategory() async {
    if (_nameController.text.trim().isEmpty ||
        _selectedIconName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'اكتب اسم الفئة واختر أيقونة',
          ),
        ),
      );

      return;
    }

    final navigator = Navigator.of(context);

    await ref
        .read(categoryProvider.notifier)
        .addCategory(
          CategoriesCompanion.insert(
            name: _nameController.text.trim(),
            iconName: _selectedIconName!,
            color: AppDarkColors.primary.toARGB32(),
            type: _isIncome ? 'income' : 'expense',
          ),
        );

    if (!mounted) return;

    navigator.pop(true);
  }

  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppDarkColors.surface,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppRadius.xl,
        ),
      ),

      title: Text(
        'إضافة فئة جديدة',
        style: AppTextStyles.textTheme.titleLarge?.copyWith(
          color: AppDarkColors.textPrimary,
        ),
      ),

      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            // ============================================================
            // Category Name
            // ============================================================

            TextField(
              controller: _nameController,

              decoration: const InputDecoration(
                labelText: 'اسم الفئة',
                prefixIcon: Icon(
                  Icons.edit_rounded,
                ),
              ),
            ),

            const SizedBox(
              height: AppSpacing.lg,
            ),

            // ============================================================
            // Category Type
            // ============================================================

            Row(
              children: [
                Expanded(
                  child: _TypeCard(
                    title: 'مصروف',
                    icon: Icons.arrow_downward_rounded,
                    selected: !_isIncome,
                    activeColor: AppDarkColors.expense,

                    onTap: () {
                      setState(() {
                        _isIncome = false;
                      });
                    },
                  ),
                ),

                const SizedBox(
                  width: AppSpacing.md,
                ),

                Expanded(
                  child: _TypeCard(
                    title: 'دخل',
                    icon: Icons.arrow_upward_rounded,
                    selected: _isIncome,
                    activeColor: AppDarkColors.income,

                    onTap: () {
                      setState(() {
                        _isIncome = true;
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: AppSpacing.md,
            ),

            // ============================================================
            // Icon Selector
            // ============================================================

            Align(
              alignment: Alignment.centerRight,

              child: Text(
                'الأيقونة',
                style: AppTextStyles.textTheme.titleMedium?.copyWith(
                  color: AppDarkColors.textPrimary,
                ),
              ),
            ),

            const SizedBox(
              height: AppSpacing.md,
            ),

            Wrap(
              spacing: 12,
              runSpacing: 12,

              children: _icons.map(
                (iconName) {
                  final isSelected =
                      _selectedIconName == iconName;

                  return InkWell(
                    borderRadius:
                        BorderRadius.circular(12),

                    onTap: () {
                      setState(() {
                        _selectedIconName = iconName;
                      });
                    },

                    child: Icon(
                      AppIcons.getCategoryIcon(
                        iconName,
                      ),

                      size: 25,

                      color: isSelected
                          ? AppDarkColors.primary
                          : AppDarkColors.textSecondary,
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),

      // ============================================================
      // Actions
      // ============================================================

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
          onPressed: _saveCategory,

          child: const Text(
            'حفظ',
          ),
        ),
      ],
    );
  }
}

// ============================================================
// Category Type Card
// ============================================================

class _TypeCard extends StatelessWidget {
  const _TypeCard({
    required this.title,
    required this.icon,
    required this.selected,
    required this.activeColor,
    required this.onTap,
  });

  final String title;

  final IconData icon;

  final bool selected;

  final VoidCallback onTap;

  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    final borderColor = selected
        ? activeColor
        : AppDarkColors.border;

    final backgroundColor = selected
        ? activeColor.withValues(
            alpha: 0.12,
          )
        : AppDarkColors.surface;

    return InkWell(
      borderRadius: BorderRadius.circular(
        AppRadius.lg,
      ),

      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 200,
        ),

        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
        ),

        decoration: BoxDecoration(
          color: backgroundColor,

          borderRadius: BorderRadius.circular(
            AppRadius.lg,
          ),

          border: Border.all(
            color: borderColor,
            width: selected ? 2 : 1,
          ),
        ),

        child: Column(
          children: [
            Icon(
              icon,

              color: selected
                  ? activeColor
                  : AppDarkColors.textSecondary,

              size: 22,
            ),

            const SizedBox(
              height: 6,
            ),

            Text(
              title,

              style: AppTextStyles.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppDarkColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}