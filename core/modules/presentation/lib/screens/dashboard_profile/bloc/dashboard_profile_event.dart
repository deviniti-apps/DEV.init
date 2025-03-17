part of 'dashboard_profile_bloc.dart';

@freezed
abstract class DashboardProfileEvent with _$DashboardProfileEvent {
  const factory DashboardProfileEvent.onInitiated() = _OnInitiated;
}
