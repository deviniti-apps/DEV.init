import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/application/app.dart';
import 'package:presentation/common/state_type.dart';
import 'package:presentation/components/snack_bar/snack_bar.dart';
import 'package:presentation/screens/welcome/bloc/welcome_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WelcomeBloc, WelcomeState>(
          listenWhen: (previous, current) => previous.type != current.type && current.type == StateType.error,
          listener: (context, state) {
            context.showSnackBarMessage(SnackBarMessage.from("Something went wrong"));
          },
        ),
        BlocListener<WelcomeBloc, WelcomeState>(
          listenWhen: (previous, current) => previous.type != current.type && current.type == StateType.success,
          listener: (context, state) {
            context.showSnackBarMessage(SnackBarMessage.from("User logged in"));
          },
        ),
      ],
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome'),
              Gap.large,
              FilledButton(
                onPressed: () => context.read<WelcomeBloc>().add(const WelcomeEvent.onLoggedIn()),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
