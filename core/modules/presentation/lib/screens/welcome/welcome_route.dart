import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/injector_container.dart';
import 'package:presentation/screens/welcome/bloc/welcome_bloc.dart';
import 'package:presentation/screens/welcome/welcome_argument.dart';
import 'package:presentation/screens/welcome/welcome_screen.dart';

Widget welcomeRoute(GoRouterState state) =>  MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeBloc>(
          create: (context) => injector<WelcomeBloc>(
            param1: state.extra ?? const WelcomeArgument(),
          )..add(const WelcomeEvent.onInitiated()),
        ),
      ],
      child: WelcomeScreen(),
    );
  
