import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/components/snack_bar/snack_bar_message.dart';

part 'snack_bar_bloc.freezed.dart';
part 'snack_bar_event.dart';
part 'snack_bar_state.dart';

class SnackBarBloc extends Bloc<SnackBarEvent, SnackBarState> {
  SnackBarBloc() : super(const SnackBarState.initial()) {
    on<SnackBarEvent>(onEachEvent, transformer: sequential());
  }

  Future<void> onEachEvent(
    SnackBarEvent event,
    Emitter<SnackBarState> emit,
  ) async {
    await event.map(
      showMessageRequested: (value) async {
        emit(const SnackBarState.initial());
        emit(SnackBarState.showMessage(snackBarMessage: value.snackBarMessage));
      },
    );
  }
}
