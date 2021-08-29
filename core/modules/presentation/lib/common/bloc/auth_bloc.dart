import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const _Initialized());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield* event.map(
      initiated: _mapInitiated,
      authCheckRequested: _mapAuthCheckRequested,
      signedOut: _mapSignedOut,
    );
  }

  Stream<AuthState> _mapInitiated(_Initiated event) async* {}

  Stream<AuthState> _mapAuthCheckRequested(_AuthCheckRequested event) async* {}

  Stream<AuthState> _mapSignedOut(_SignedOut event) async* {}
}
