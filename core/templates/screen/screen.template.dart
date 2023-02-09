import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/application/dimen.dart';
import 'package:presentation/common/state_type.dart';
import 'package:presentation/screens/_SNAKE_CASE_NAME_/bloc/_SNAKE_CASE_NAME__bloc.dart';
import 'package:presentation/widgets/empty_page_widget.dart';
import 'package:presentation/widgets/error_page_widget.dart';
import 'package:presentation/widgets/loading_page_widget.dart';

class _UPPER_CAMEL_CASE_NAME_Screen extends StatelessWidget {
  static const String routeName = '/_DASH_CASE_NAME_';

  // context.strings._CAMEL_CASE_NAME_ScreenTitle,

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('_UPPER_CAMEL_CASE_NAME_'),
      ),
      body: SafeArea(
        top: false,
        child: BlocBuilder<_UPPER_CAMEL_CASE_NAME_Bloc, _UPPER_CAMEL_CASE_NAME_State>(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '',
                            arguments: 1,
                          );
                        },
                        child: const Text('-'),
                      )
                    ],
                  ),
                );
              },
              empty: () => const EmptyPage(),
              error: () => const ErrorPage(),
              initial: () => const SizedBox.shrink(),
              success: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
