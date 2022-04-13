import 'package:flutter/material.dart';
import 'package:presentation/screens/splash/splash_screen.dart';

Route<dynamic> splashRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => const SplashScreen(),
  );
}
