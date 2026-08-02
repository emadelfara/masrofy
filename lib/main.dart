// -----------------------------------------------------------------------------
// Imports
// -----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:masrofy/app/masrofy_app.dart';

// -----------------------------------------------------------------------------
// App Entry Point
// -----------------------------------------------------------------------------

void main() {
  runApp(
    const ProviderScope(
      child: MasrofyApp(),
    ),
  );
}