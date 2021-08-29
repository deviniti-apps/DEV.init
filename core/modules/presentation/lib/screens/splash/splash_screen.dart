import 'package:flutter/material.dart';
import 'package:presentation/l10n/translations.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child:  Center(
          child: Text(
            Translations.of(context)!.splash,
          ),
        ),
      ),
    );
  }
}
