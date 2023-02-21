import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/application/app.dart';
import 'package:presentation/components/auth/bloc/auth_bloc.dart';

class DashboardProfileScreen extends StatelessWidget {
  static const routeName = '/dashboard-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile'),
            Gap.large,
            FilledButton(
              onPressed: () => context.read<AuthBloc>().add(const AuthEvent.onSignedOut()),
              child: const Text('Wyloguj'),
            ),
          ],
        ),
      ),
    );
  }
}
