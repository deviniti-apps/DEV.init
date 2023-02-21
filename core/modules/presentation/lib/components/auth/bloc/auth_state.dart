part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required StateType userStateType,
    User? user,
  }) = _AuthState;

  const AuthState._();

  factory AuthState.initial() => const AuthState(
        userStateType: StateType.initial,
      );

  bool get isLoggedIn => user != null;
}
