import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/injector_container.dart';
import 'package:presentation/screens/_SNAKE_CASE_NAME_/bloc/_SNAKE_CASE_NAME__bloc.dart';
import 'package:presentation/screens/_SNAKE_CASE_NAME_/_SNAKE_CASE_NAME__screen.dart';

Route<dynamic> _CAMEL_CASE_NAME_Route(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider<_UPPER_CAMEL_CASE_NAME_Bloc>(
          create: (context) => injector<_UPPER_CAMEL_CASE_NAME_Bloc>(
            param1: settings.arguments,
          )..add(const _UPPER_CAMEL_CASE_NAME_Event.started()),
        ),
      ],
      child: _UPPER_CAMEL_CASE_NAME_Screen(),
    ),
  );
}
