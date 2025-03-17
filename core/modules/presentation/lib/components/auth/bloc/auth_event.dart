part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.onInitiated() = _OnInitiated;
  const factory AuthEvent.onUserUpdated(User? user) = _OnUserUpdated;
  const factory AuthEvent.onAuthCheckRequested() = _OnAuthCheckRequested;
  const factory AuthEvent.onSignedOut() = _OnSignedOut;
}
