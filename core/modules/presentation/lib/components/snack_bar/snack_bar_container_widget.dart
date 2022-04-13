import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/application/dimen.dart';
import 'package:presentation/application/theme.dart';
import 'package:presentation/components/snack_bar/snack_bar.dart';

class SnackBarContainer extends StatelessWidget {
  const SnackBarContainer({
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SnackBarBloc, SnackBarState>(
      listener: (context, state) {
        state.mapOrNull(
          showMessage: (it) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: it.snackBarMessage.background ?? context.palette.snackBarColor,
                content: Row(
                  children: [
                    if (it.snackBarMessage.icon != null) ...[
                      it.snackBarMessage.icon!,
                      const SizedBox(width: Insets.xSmall),
                    ],
                    Expanded(child: Text(it.snackBarMessage.message)),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: Insets.large, vertical: Insets.xLarge),
                margin: const EdgeInsets.symmetric(horizontal: Insets.xxxLarge, vertical: Insets.large),
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                dismissDirection: DismissDirection.startToEnd,
              ),
            );
          },
        );
      },
      child: child,
    );
  }
}
