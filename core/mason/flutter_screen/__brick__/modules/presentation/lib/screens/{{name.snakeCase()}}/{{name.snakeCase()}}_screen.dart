import 'package:flutter/material.dart';{{#bloc}}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/application/dimen.dart';
import 'package:presentation/common/state_type.dart';
import 'package:presentation/screens/{{name.snakeCase()}}/bloc/{{name.snakeCase()}}_bloc.dart';
import 'package:presentation/widgets/empty_page_widget.dart';
import 'package:presentation/widgets/error_page_widget.dart';
import 'package:presentation/widgets/loading_page_widget.dart';{{/bloc}}

class {{name.pascalCase()}}Screen extends StatelessWidget {
  static const routeName = '/{{name.paramCase()}}';

  @override
  Widget build(BuildContext context) {
    return Scaffold({{#appBar}}
      appBar: AppBar(
        title: const Text(''), // context.strings.{{name.camelCase()}}ScreenTitle,
      ),{{/appBar}}
      body: SafeArea({{#bloc}}
        child: BlocBuilder<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
          buildWhen: (oldState, newState) => oldState.type != newState.type,
          builder: (context, state) {
            return state.type.map(
              loading: () => const LoadingPage(),
              loaded: () {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Insets.medium,
                    horizontal: Insets.large,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [],
                  ),
                );
              },
              empty: () => const EmptyPage(),
              error: () => const ErrorPage(),
            );
          },
        ),{{/bloc}}{{^bloc}}
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [],
        ),{{/bloc}}
      ),
    );
  }
}

