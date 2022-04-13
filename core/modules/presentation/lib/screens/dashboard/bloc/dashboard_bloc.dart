import 'dart:async';

import 'package:domain/model/user.dart';
import 'package:domain/usecase/get_user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/common/state_type.dart';
import 'package:presentation/screens/dashboard/dashboard_argument.dart';

part 'dashboard_bloc.freezed.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required DashboardArgument argument,
    required GetUserUsecase getUserUsecase,
  })  : _getUserUsecase = getUserUsecase,
        super(DashboardState.initial(argument: argument)) {
    on<_DashboardStarted>(_onStartedEvent);
  }

  final GetUserUsecase _getUserUsecase;

  Future<void> _onStartedEvent(
    _DashboardStarted event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(type: StateType.loading));
    final newState = await _getUserUsecase
        .execute()
        .match(
          (l) => state.copyWith(type: StateType.error),
          (user) => state.copyWith(type: StateType.loaded, user: user),
        )
        .run();
    emit(newState);
  }
}
