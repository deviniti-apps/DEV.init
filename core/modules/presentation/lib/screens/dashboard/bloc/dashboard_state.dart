part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    required StateType type,
    required DashboardArgument argument,
    required User? user,
  }) = _DashboardState;

  factory DashboardState.initial({required DashboardArgument argument}) {
    return DashboardState(
      type: StateType.loading,
      argument: argument,
      user: null,
    );
  }
}
