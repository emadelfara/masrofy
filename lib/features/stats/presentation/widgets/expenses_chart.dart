// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/formatters/chart_number_formatter.dart';
import 'package:masrofy/core/providers/chart_provider.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';

// ==========================
// Class
// ==========================

class ExpensesChart extends ConsumerWidget {
  const ExpensesChart({
    super.key,
  });

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartAsync = ref.watch(
      chartProvider,
    );

    return Container(
      padding: const EdgeInsets.all(
        AppSpacing.lg,
      ),

      decoration: BoxDecoration(
        color: AppDarkColors.surface,

        borderRadius: BorderRadius.circular(
          AppRadius.xl,
        ),

        border: Border.all(
          color: AppDarkColors.border,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // ==========================
          // Card Header
          // ==========================

          Row(
            children: [
              Icon(
                Icons.bar_chart_rounded,
                color: AppDarkColors.primary,
              ),

              const SizedBox(
                width: AppSpacing.sm,
              ),

              Text(
                'تحليل الإنفاق',

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
          // Chart Area
          // ==========================

          SizedBox(
            height: 180,

            child: chartAsync.when(
              // ==========================
              // Loading State
              // ==========================

              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),

              // ==========================
              // Error State
              // ==========================

              error: (_, _) => const Center(
                child: Text(
                  'حدث خطأ أثناء تحميل البيانات',
                ),
              ),

              // ==========================
              // Success State
              // ==========================

              data: (bars) {
                final maxAmount = bars.fold<double>(
                  0,
                  (max, item) =>
                      item.amount > max ? item.amount : max,
                );

                final highestIndex = bars.indexWhere(
                  (bar) => bar.amount == maxAmount,
                );

                if (bars.length <= 7) {
                  return Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.end,

                    children: List.generate(
                      bars.length,
                      (index) {
                        final height = maxAmount == 0
                            ? 8.0
                            : (bars[index].amount / maxAmount) * 120;

                        return Expanded(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.end,

                            children: [
                              if (index == highestIndex &&
                                  maxAmount > 0)
                                _HighestIndicator(),

                              _ChartBar(
                                height: height,
                              ),

                              const SizedBox(
                                height: 8,
                              ),

                              _ChartAmount(
                                amount: bars[index].amount,
                              ),

                              const SizedBox(
                                height: 4,
                              ),

                              _ChartLabel(
                                label: bars[index].label,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.end,

                    children: List.generate(
                      bars.length,
                      (index) {
                        final height = maxAmount == 0
                            ? 8.0
                            : (bars[index].amount / maxAmount) * 120;

                        return SizedBox(
                          width: 42,

                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.end,

                            children: [
                              if (index == highestIndex &&
                                  maxAmount > 0)
                                _HighestIndicator(),

                              _ChartBar(
                                height: height,
                              ),

                              const SizedBox(
                                height: 8,
                              ),

                              _ChartAmount(
                                amount: bars[index].amount,
                              ),

                              const SizedBox(
                                height: 4,
                              ),

                              _ChartLabel(
                                label: bars[index].label,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================
// Private Widgets
// ==========================

class _HighestIndicator extends StatelessWidget {
  const _HighestIndicator();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,

      margin: const EdgeInsets.only(
        bottom: 6,
      ),

      decoration: const BoxDecoration(
        color: AppDarkColors.primary,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _ChartBar extends StatelessWidget {
  const _ChartBar({
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,

      height: height.clamp(
        8.0,
        120.0,
      ),

      decoration: BoxDecoration(
        color: AppDarkColors.primary,

        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
    );
  }
}

class _ChartAmount extends StatelessWidget {
  const _ChartAmount({
    required this.amount,
  });

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Text(
      amount == 0
          ? '-'
          : ChartNumberFormatter.format(amount),

      maxLines: 1,

      overflow: TextOverflow.ellipsis,

      textAlign: TextAlign.center,

      style: AppTextStyles.textTheme.labelSmall?.copyWith(
        color: AppDarkColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _ChartLabel extends StatelessWidget {
  const _ChartLabel({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,

      style: AppTextStyles.textTheme.bodySmall?.copyWith(
        color: AppDarkColors.textSecondary,
      ),
    );
  }
}