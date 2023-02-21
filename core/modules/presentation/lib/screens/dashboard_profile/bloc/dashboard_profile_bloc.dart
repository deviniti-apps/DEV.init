import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/common/state_type.dart';
import 'package:presentation/screens/dashboard_profile/dashboard_profile_argument.dart';

part 'dashboard_profile_bloc.freezed.dart';

part 'dashboard_profile_event.dart';

part 'dashboard_profile_state.dart';

class DashboardProfileBloc extends Bloc<DashboardProfileEvent, DashboardProfileState> {
  DashboardProfileBloc({
    required DashboardProfileArgument argument,
  }) : super(DashboardProfileState.initial(argument: argument)) {
    on<_OnInitiated>(_onInitiated);
  }

  Future<void> _onInitiated(_OnInitiated event, Emitter<DashboardProfileState> emit) async {}
}
