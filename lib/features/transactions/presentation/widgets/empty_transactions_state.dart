// ==========================
// Imports
// ==========================

import 'package:flutter/material.dart';

// ==========================
// Class
// ==========================

class EmptyTransactionsState extends StatelessWidget {
  const EmptyTransactionsState({
    super.key,
  });

  // ==========================
  // Build
  // ==========================

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          // ==========================
          // Empty Icon
          // ==========================

          Icon(
            Icons.receipt_long_outlined,

            size: 72,

            color: Theme.of(context)
                .colorScheme
                .outline,
          ),

          const SizedBox(
            height: 16,
          ),

          // ==========================
          // Empty Title
          // ==========================

          Text(
            'لا توجد معاملات',

            style: Theme.of(context)
                .textTheme
                .titleLarge,
          ),

          const SizedBox(
            height: 8,
          ),

          // ==========================
          // Empty Description
          // ==========================

          Text(
            'جرّب تغيير البحث أو الفلتر',

            style: Theme.of(context)
                .textTheme
                .bodyMedium,
          ),
        ],
      ),
    );
  }
}