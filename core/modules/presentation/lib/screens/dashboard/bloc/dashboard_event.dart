part of 'dashboard_bloc.dart';

@freezed
abstract class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.onInitiated() = _OnInitiated;
}
