import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/application/app.dart';
import 'package:presentation/components/auth/bloc/auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Insets.medium,
          horizontal: Insets.large,
        ),
        child: Center(
          child: TextButton(
            onPressed: () => context.read<AuthBloc>().add(const AuthEvent.authenticated()),
            child: const Text('Start'),
          ),
        ),
      ),
    );
  }
}
