// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';

import 'package:masrofy/core/theme/app_colors.dart';
import 'package:masrofy/core/theme/app_text_styles.dart';


// ============================================================
// Goals Header
// ============================================================

class GoalsHeader extends StatelessWidget {
  const GoalsHeader({
    super.key,
  });



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
        // Screen Title
        // ============================================================

        Text(

          'الأهداف',


          style: AppTextStyles
              .textTheme
              .headlineMedium
              ?.copyWith(

                color:
                    AppDarkColors.textPrimary,


                fontWeight:
                    FontWeight.bold,

              ),

        ),



        const SizedBox(

          height: 6,

        ),



        // ============================================================
        // Screen Description
        // ============================================================

        Text(

          'تابع أهدافك الادخارية وحققها خطوة بخطوة.',


          style: AppTextStyles
              .textTheme
              .bodyMedium
              ?.copyWith(

                color:
                    AppDarkColors.textSecondary,

              ),

        ),


      ],

    );

  }

}