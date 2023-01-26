part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    required StateType type,
    required User? user,
  }) = _DashboardState;

  factory DashboardState.initial() {
    return const DashboardState(
      type: StateType.loading,
      user: null,
    );
  }
}
