import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/components/auth/bloc/auth_bloc.dart';
import 'package:presentation/screens/dashboard/dashboard_route.dart';
import 'package:presentation/screens/dashboard_home/dashboard_home_route.dart';
import 'package:presentation/screens/dashboard_home/dashboard_home_screen.dart';
import 'package:presentation/screens/dashboard_profile/dashboard_profile_route.dart';
import 'package:presentation/screens/dashboard_profile/dashboard_profile_screen.dart';
import 'package:presentation/screens/splash/splash_route.dart';
import 'package:presentation/screens/splash/splash_screen.dart';
import 'package:presentation/screens/welcome/welcome_route.dart';
import 'package:presentation/screens/welcome/welcome_screen.dart';

class AppRouteFactory {
  GoRouter router({
    required GlobalKey<NavigatorState> rootNavigatorKey,
    required GlobalKey<NavigatorState> shellNavigatorKey,
  }) =>
      GoRouter(
        navigatorKey: rootNavigatorKey,
        initialLocation: SplashScreen.routeName,
        errorBuilder: (context, state) {
          context.read<AuthBloc>().add(const AuthEvent.onSignedOut());
          return splashRoute(state);
        },
        routes: [
          GoRoute(
            path: SplashScreen.routeName,
            parentNavigatorKey: rootNavigatorKey,
            builder: (_, state) => splashRoute(state),
          ),
          GoRoute(
            path: WelcomeScreen.routeName,
            parentNavigatorKey: rootNavigatorKey,
            builder: (_, state) => welcomeRoute(state),
          ),
          ShellRoute(
            navigatorKey: shellNavigatorKey,
            builder: (_, state, child) => dashboardRoute(state, child),
            routes: [
              GoRoute(
                path: DashboardHomeScreen.routeName,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: dashboardHomeRoute(state),
                ),
              ),
              GoRoute(
                path: DashboardProfileScreen.routeName,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: dashboardProfileRoute(state),
                ),
              ),
            ],
          ),
        ],
      );
}
