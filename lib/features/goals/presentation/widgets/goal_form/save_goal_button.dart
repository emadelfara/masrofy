// ============================================================
// Imports
// ============================================================

import 'package:flutter/material.dart';


// ============================================================
// Save Goal Button
// ============================================================

class SaveGoalButton extends StatelessWidget {
  const SaveGoalButton({
    super.key,
    required this.onPressed,
  });


  // ============================================================
  // Properties
  // ============================================================

  final VoidCallback onPressed;



  // ============================================================
  // Build UI
  // ============================================================

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      width: double.infinity,


      child: ElevatedButton.icon(

        onPressed: onPressed,


        // ============================================================
        // Button Icon
        // ============================================================

        icon: const Icon(

          Icons.flag_rounded,

        ),



        // ============================================================
        // Button Label
        // ============================================================

        label: const Text(

          'حفظ الهدف',

        ),

      ),

    );

  }

}