import 'package:flutter/material.dart';{{#bloc}}
import 'package:flutter_bloc/flutter_bloc.dart';{{/bloc}}
import 'package:go_router/go_router.dart';{{#bloc}}
import 'package:presentation/injector_container.dart';
import 'package:presentation/screens/{{name.snakeCase()}}/bloc/{{name.snakeCase()}}_bloc.dart';
import 'package:presentation/screens/{{name.snakeCase()}}/{{name.snakeCase()}}_argument.dart';{{/bloc}}
import 'package:presentation/screens/{{name.snakeCase()}}/{{name.snakeCase()}}_screen.dart';

Widget {{name.camelCase()}}Route(GoRouterState state) => {{#bloc}} MultiBlocProvider(
      providers: [
        BlocProvider<{{name.pascalCase()}}Bloc>(
          create: (context) => injector<{{name.pascalCase()}}Bloc>(
            param1: state.extra ?? const {{name.pascalCase()}}Argument(),
          )..add(const {{name.pascalCase()}}Event.onInitiated()),
        ),
      ],
      child: {{name.pascalCase()}}Screen(),
    );{{/bloc}}{{^bloc}}{{name.pascalCase()}}Screen();{{/bloc}}
  
