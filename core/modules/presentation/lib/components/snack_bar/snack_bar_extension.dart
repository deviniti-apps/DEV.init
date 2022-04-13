import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/components/snack_bar/bloc/snack_bar_bloc.dart';
import 'package:presentation/components/snack_bar/snack_bar_message.dart';

extension $_SnackBarExtension on BuildContext {
  void showSnackBarMessage(SnackBarMessage message) {
    read<SnackBarBloc>().add(SnackBarEvent.showMessageRequested(snackBarMessage: message));
  }
}
