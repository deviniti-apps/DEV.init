import 'package:flutter/material.dart';
import 'package:presentation/screens/dashboard/dashboard_route.dart';
import 'package:presentation/screens/dashboard/dashboard_screen.dart';
import 'package:presentation/screens/splash/splash_route.dart';
import 'package:presentation/screens/splash/splash_screen.dart';

class AppRouteFactory {
  Route<dynamic> route(RouteSettings settings) {
    switch (settings.name) {
      case DashboardScreen.routeName:
        return dashboardRoute(settings);
      case SplashScreen.routeName:
      default:
        return splashRoute(settings);
    }
  }
}
