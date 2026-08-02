// -----------------------------------------------------------------------------
// Flutter Imports
// -----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// -----------------------------------------------------------------------------
// Project Imports
// -----------------------------------------------------------------------------

import 'package:masrofy/core/theme/app_theme.dart';
import 'package:masrofy/features/splash/presentation/splash_screen.dart';

// -----------------------------------------------------------------------------
// Application Widget
// -----------------------------------------------------------------------------

class MasrofyApp extends StatelessWidget {
  const MasrofyApp({super.key});

  // ---------------------------------------------------------------------------
  // Build Method
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masrofy',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,

      locale: const Locale('ar'),

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],

      home: const SplashScreen(),

      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}