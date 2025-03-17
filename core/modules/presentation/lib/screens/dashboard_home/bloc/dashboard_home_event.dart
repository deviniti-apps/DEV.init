part of 'dashboard_home_bloc.dart';

@freezed
abstract class DashboardHomeEvent with _$DashboardHomeEvent {
  const factory DashboardHomeEvent.onInitiated() = _OnInitiated;
}
