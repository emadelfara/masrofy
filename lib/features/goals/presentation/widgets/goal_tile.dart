// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';
import 'package:masrofy/core/widgets/app_progress_bar.dart';


// ============================================================
// Goal Tile
// ============================================================

class GoalTile extends StatelessWidget {
  const GoalTile({
    super.key,
    required this.title,
    required this.progress,
    required this.onEdit,
    required this.onDelete,
    required this.onTap,
    required this.isSelected,
  });



  // ============================================================
  // Properties
  // ============================================================

  final String title;

  final double progress;

  final VoidCallback onEdit;

  final VoidCallback onDelete;

  final VoidCallback onTap;

  final bool isSelected;



  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {

    return InkWell(

      borderRadius:
          BorderRadius.circular(AppRadius.lg),


      onTap: onTap,


      child: Container(

        padding:
            const EdgeInsets.all(AppSpacing.md),


        decoration: BoxDecoration(

          color: AppDarkColors.surface,


          borderRadius:
              BorderRadius.circular(AppRadius.lg),


          border: Border.all(

            color: isSelected
                ? AppDarkColors.primary
                : AppDarkColors.border,


            width: isSelected ? 2 : 1,

          ),

        ),



        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,


          children: [


            // ============================================================
            // Goal Header
            // ============================================================

            Row(

              children: [


                Expanded(

                  child: Text(

                    title,


                    style: AppTextStyles
                        .textTheme
                        .titleMedium
                        ?.copyWith(

                          fontWeight:
                              FontWeight.w600,


                          color:
                              AppDarkColors.textPrimary,

                        ),

                  ),

                ),



                // ============================================================
                // Edit Button
                // ============================================================

                IconButton(

                  onPressed: onEdit,


                  icon: const Icon(

                    Icons.edit_rounded,

                    color: Colors.amber,

                  ),

                ),



                // ============================================================
                // Delete Button
                // ============================================================

                IconButton(

                  onPressed: onDelete,


                  icon: const Icon(

                    Icons.delete_rounded,

                    color: Colors.redAccent,

                  ),

                ),


              ],

            ),



            const SizedBox(

              height: AppSpacing.md,

            ),



            // ============================================================
            // Progress
            // ============================================================

            AppProgressBar(

              value: progress,

            ),



            const SizedBox(

              height: AppSpacing.sm,

            ),



            // ============================================================
            // Progress Percentage
            // ============================================================

            Align(

              alignment:
                  Alignment.centerRight,


              child: Text(

                '${(progress * 100).toInt()}% مكتمل',


                style: AppTextStyles
                    .textTheme
                    .bodySmall
                    ?.copyWith(

                      color:
                          AppDarkColors.primary,


                      fontWeight:
                          FontWeight.w600,

                    ),

              ),

            ),


          ],

        ),

      ),

    );

  }

}