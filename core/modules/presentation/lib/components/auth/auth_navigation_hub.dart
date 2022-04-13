import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/components/auth/bloc/auth_bloc.dart';
import 'package:presentation/screens/dashboard/dashboard_screen.dart';
import 'package:presentation/screens/splash/splash_screen.dart';

class AuthNavigationHub extends StatelessWidget {
  const AuthNavigationHub({
    required this.navigatorKey,
    required this.child,
    Key? key,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (!state.isAuthenticated) {
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            SplashScreen.routeName,
            (_) => false,
          );
          return;
        }

        if (state.isAuthenticated) {
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            DashboardScreen.routeName,
            (_) => false,
          );
          return;
        }
      },
      child: child,
    );
  }
}
