part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = AuthEventInitiated;

  const factory AuthEvent.authenticated() = AuthEventAuthenticated;

  const factory AuthEvent.unauthenticated() = AuthEventUnAuthenticated;
}
