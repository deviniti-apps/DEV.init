import 'package:flutter/material.dart';{{#bloc}}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/injector_container.dart';
import 'package:presentation/screens/{{name.snakeCase()}}/bloc/{{name.snakeCase()}}_bloc.dart';{{/bloc}}
import 'package:presentation/screens/{{name.snakeCase()}}/{{name.snakeCase()}}_screen.dart';

Route<dynamic> {{name.camelCase()}}Route(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,{{#bloc}}
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider<{{name.pascalCase()}}Bloc>(
          create: (context) => injector<{{name.pascalCase()}}Bloc>(
            param1: settings.arguments,
          )..add(const {{name.pascalCase()}}Event.initiated()),
        ),
      ],
      child: {{name.pascalCase()}}Screen(),
    ),{{/bloc}}{{^bloc}}
    builder: (context) => {{name.pascalCase()}}Screen(),{{/bloc}}
  );
}
