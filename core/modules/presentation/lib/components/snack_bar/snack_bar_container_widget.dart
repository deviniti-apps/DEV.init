import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/application/app.dart';
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
        if (state is SnackBarShowMessage) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: state.snackBarMessage.background ?? context.palette.snackBarColor,
              content: Row(
                children: [
                  if (state.snackBarMessage.icon != null) ...[
                    state.snackBarMessage.icon!,
                    const SizedBox(width: Insets.xSmall),
                  ],
                  Expanded(child: Text(state.snackBarMessage.message)),
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
        }
      },
      child: child,
    );
  }
}
