part of 'welcome_bloc.dart';

@freezed
class WelcomeEvent with _$WelcomeEvent {
  const factory WelcomeEvent.onInitiated() = _OnInitiated;
  const factory WelcomeEvent.onLoggedIn() = _OnLoggedIn;
}
