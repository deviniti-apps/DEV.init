part of 'dashboard_home_bloc.dart';

@freezed
abstract class DashboardHomeState with _$DashboardHomeState {
  const factory DashboardHomeState({
    required StateType type,
    required DashboardHomeArgument argument,
  }) = _DashboardHomeState;

  factory DashboardHomeState.initial({required DashboardHomeArgument argument}) {
    return DashboardHomeState(
      type: StateType.loading,
      argument: argument,
    );
  }
}
