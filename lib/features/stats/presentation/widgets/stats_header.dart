// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

// ==========================
// Class
// ==========================

class StatsHeader extends StatelessWidget {
  const StatsHeader({
    super.key,
  });

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // ==========================
        // Title
        // ==========================

        Text(
          'الإحصائيات',

          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: 4,
        ),

        // ==========================
        // Description
        // ==========================

        Text(
          'تحليل دخلك ومصروفاتك بسهولة.',

          style: textTheme.bodyMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}