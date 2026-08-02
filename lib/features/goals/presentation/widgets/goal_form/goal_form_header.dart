// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';


// ============================================================
// Goal Form Header
// ============================================================

class GoalFormHeader extends StatelessWidget {
  const GoalFormHeader({
    super.key,
  });



  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {

    return Row(

      children: [


        // ============================================================
        // Back Button
        // ============================================================

        IconButton(

          onPressed: () {

            Navigator.pop(context);

          },

          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),

        ),



        const SizedBox(

          width: 8,

        ),



        // ============================================================
        // Screen Title
        // ============================================================

        Expanded(

          child: Text(

            'إضافة هدف جديد',

            style: Theme.of(context)
                .textTheme
                .headlineSmall,

          ),

        ),


      ],

    );

  }

}