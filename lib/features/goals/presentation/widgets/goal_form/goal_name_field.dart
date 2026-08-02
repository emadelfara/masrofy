// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';


// ============================================================
// Goal Name Field
// ============================================================

class GoalNameField extends StatelessWidget {
  const GoalNameField({
    super.key,
    required this.controller,
  });


  // ============================================================
  // Properties
  // ============================================================

  final TextEditingController controller;



  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment:
          CrossAxisAlignment.start,


      children: [


        // ============================================================
        // Field Label
        // ============================================================

        Text(

          'اسم الهدف',

          style: AppTextStyles.textTheme.titleMedium?.copyWith(

            color: AppDarkColors.textPrimary,

            fontWeight: FontWeight.bold,

          ),

        ),



        const SizedBox(

          height: AppSpacing.md,

        ),



        // ============================================================
        // Text Field
        // ============================================================

        TextFormField(

          controller: controller,

          textInputAction: TextInputAction.next,


          decoration: InputDecoration(

            hintText: 'مثال: شراء MacBook',


            // ============================================================
            // Prefix Icon
            // ============================================================

            prefixIcon: const Icon(
              Icons.flag_rounded,
            ),



            // ============================================================
            // Colors
            // ============================================================

            filled: true,

            fillColor: AppDarkColors.surface,



            // ============================================================
            // Border
            // ============================================================

            border: OutlineInputBorder(

              borderRadius:
                  BorderRadius.circular(AppRadius.lg),

            ),



            enabledBorder: OutlineInputBorder(

              borderRadius:
                  BorderRadius.circular(AppRadius.lg),

              borderSide: const BorderSide(

                color: AppDarkColors.border,

              ),

            ),



            focusedBorder: OutlineInputBorder(

              borderRadius:
                  BorderRadius.circular(AppRadius.lg),

              borderSide: const BorderSide(

                color: AppDarkColors.primary,

                width: 2,

              ),

            ),

          ),



          // ============================================================
          // Validation
          // ============================================================

          validator: (value) {

            final text = value?.trim() ?? '';



            if (text.isEmpty) {

              return 'من فضلك أدخل اسم الهدف';

            }



            if (text.length < 3) {

              return 'يجب أن يحتوي الاسم على 3 أحرف على الأقل';

            }



            return null;

          },

        ),


      ],

    );

  }

}