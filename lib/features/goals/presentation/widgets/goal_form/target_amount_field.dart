// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/constants/app_radius.dart';
import 'package:masrofy/core/constants/app_spacing.dart';
import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';


// ============================================================
// Target Amount Field
// ============================================================

class TargetAmountField extends StatelessWidget {
  const TargetAmountField({
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

          'المبلغ المستهدف',

          style: AppTextStyles.textTheme.titleMedium?.copyWith(

            color: AppDarkColors.textPrimary,

            fontWeight: FontWeight.bold,

          ),

        ),



        const SizedBox(

          height: AppSpacing.md,

        ),



        // ============================================================
        // Amount Field
        // ============================================================

        TextFormField(

          controller: controller,


          keyboardType:
              const TextInputType.numberWithOptions(
                decimal: true,
              ),


          textInputAction:
              TextInputAction.next,



          decoration: InputDecoration(


            hintText: 'مثال: 20000',



            // ============================================================
            // Prefix Icon
            // ============================================================

            prefixIcon: const Icon(

              Icons.savings_rounded,

            ),



            // ============================================================
            // Currency Suffix
            // ============================================================

            suffixText: 'ج.م',



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

              return 'من فضلك أدخل المبلغ المستهدف';

            }



            final amount = double.tryParse(text);



            if (amount == null) {

              return 'أدخل مبلغًا صحيحًا';

            }



            if (amount <= 0) {

              return 'يجب أن يكون المبلغ أكبر من صفر';

            }



            return null;

          },

        ),


      ],

    );

  }

}