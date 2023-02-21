import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/common/state_type.dart';
import 'package:presentation/screens/dashboard_home/dashboard_home_argument.dart';

part 'dashboard_home_bloc.freezed.dart';

part 'dashboard_home_event.dart';

part 'dashboard_home_state.dart';

class DashboardHomeBloc extends Bloc<DashboardHomeEvent, DashboardHomeState> {
  DashboardHomeBloc({
    required DashboardHomeArgument argument,
  }) : super(DashboardHomeState.initial(argument: argument)) {
    on<_OnInitiated>(_onInitiated);
  }

  Future<void> _onInitiated(_OnInitiated event, Emitter<DashboardHomeState> emit) async {}
}
