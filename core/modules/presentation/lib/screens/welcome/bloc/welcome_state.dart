part of 'welcome_bloc.dart';

@freezed
class WelcomeState with _$WelcomeState {
  const factory WelcomeState({
    required StateType type,
    required WelcomeArgument argument,
  }) = _WelcomeState;

  factory WelcomeState.initial({required WelcomeArgument argument}) {
    return WelcomeState(
      type: StateType.initial,
      argument: argument,
    );
  }
}
