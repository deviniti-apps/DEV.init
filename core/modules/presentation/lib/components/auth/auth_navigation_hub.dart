import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/components/auth/bloc/auth_bloc.dart';
import 'package:presentation/screens/dashboard/dashboard_screen.dart';
import 'package:presentation/screens/splash/splash_screen.dart';

class AuthNavigationHub extends StatelessWidget {
  const AuthNavigationHub({
    required this.navigatorKey,
    required this.child,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (oldState, newState) => oldState.isAuthenticated != newState.isAuthenticated,
      listener: (context, state) => navigatorKey.currentState?.pushNamedAndRemoveUntil(
        state.isAuthenticated ? DashboardScreen.routeName : SplashScreen.routeName,
        (_) => false,
      ),
      child: child,
    );
  }
}
