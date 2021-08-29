part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initialize() = _Initialized;

  const factory AuthState.authenticate() = _Authenticated;

  const factory AuthState.unauthenticate() = _Unauthenticated;
}
