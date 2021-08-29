import 'package:presentation/screens/dashboard/dashboard_screen.dart';
import 'package:presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRouteFactory {
  Route<dynamic> route(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => SplashScreen(),
        );
      case DashboardScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => DashboardScreen(),
        );
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (context) => const Scaffold(),
    );
  }
}
