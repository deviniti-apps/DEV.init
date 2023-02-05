import 'dart:async';

import 'package:domain/model/user.dart';
import 'package:domain/usecase/get_user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/common/state_type.dart';

part 'dashboard_bloc.freezed.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required GetUserUsecase getUserUsecase,
  })  : _getUserUsecase = getUserUsecase,
        super(DashboardState.initial()) {
    on<_Initiated>(_mapInitiated);
  }

  final GetUserUsecase _getUserUsecase;

  Future<void> _mapInitiated(
    _Initiated event,
    Emitter<DashboardState> emit,
  ) async {
    (await _getUserUsecase.execute().run()).fold(
      (_) => emit(
        state.copyWith(
          type: StateType.error,
        ),
      ),
      (user) => emit(
        state.copyWith(
          type: StateType.loaded,
          user: user,
        ),
      ),
    );
  }
}
