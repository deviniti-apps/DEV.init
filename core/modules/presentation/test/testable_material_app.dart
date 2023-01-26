import 'package:flutter/material.dart';
import 'package:presentation/application/theme.dart';
import 'package:presentation/l10n/translations.dart';

class TestableMaterialApp extends StatelessWidget {
  const TestableMaterialApp({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: Translations.localizationsDelegates,
      supportedLocales: Translations.supportedLocales,
      theme: AppTheme().theme(LightPalette()),
      home: Scaffold(body: child),
    );
  }
}
