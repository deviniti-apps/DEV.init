import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/common/state_type.dart';
import 'package:presentation/components/auth/bloc/auth_bloc.dart';
import 'package:presentation/screens/dashboard_home/dashboard_home_screen.dart';
import 'package:presentation/screens/welcome/welcome_screen.dart';

class AuthNavigationHub extends StatelessWidget {
  const AuthNavigationHub({
    required this.rootNavigatorKey,
    required this.child,
  });

  final GlobalKey<NavigatorState> rootNavigatorKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // When user is not logged in when he entered into the app
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) =>
              previous.isLoggedIn == current.isLoggedIn && previous.userStateType == StateType.initial,
          listener: (_, __) => rootNavigatorKey.currentContext?.go(WelcomeScreen.routeName),
        ),
        // When user signed out
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) =>
              previous.isLoggedIn && !current.isLoggedIn && current.userStateType == StateType.loaded,
          listener: (_, __) => rootNavigatorKey.currentContext?.go(WelcomeScreen.routeName),
        ),
        // When user logged in
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) =>
              !previous.isLoggedIn && current.isLoggedIn && current.userStateType == StateType.loaded,
          listener: (_, __) => rootNavigatorKey.currentContext?.go(DashboardHomeScreen.routeName),
        ),
      ],
      child: child,
    );
  }
}
