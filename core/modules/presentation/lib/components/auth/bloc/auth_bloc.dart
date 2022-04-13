import 'dart:async';

import 'package:domain/unauth_stream_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required UnAuthStreamProvider unAuthStreamProvider,
  })  : _unAuthStreamProvider = unAuthStreamProvider,
        super(AuthState.initial()) {
    on<AuthEventInitiated>(_started);
    on<AuthEventAuthenticated>(_onAuthEventAuthenticated);
    on<AuthEventUnAuthenticated>(_onAuthEventUnAuthenticated);
  }

  final UnAuthStreamProvider _unAuthStreamProvider;

  StreamSubscription? _unAuthEventsSubscription;

  Future<void> _started(AuthEventInitiated event, Emitter<AuthState> emit) async {
    await _onUnAuthEvents(emit);
  }

  Future<void> _onAuthEventAuthenticated(AuthEventAuthenticated event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isAuthenticated: true));
  }

  Future<void> _onAuthEventUnAuthenticated(AuthEventUnAuthenticated event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isAuthenticated: false));
  }

  Future<void> _onUnAuthEvents(Emitter<AuthState> emit) async {
    await _unAuthEventsSubscription?.cancel();
    _unAuthEventsSubscription = _unAuthStreamProvider.stream.listen(
      (_) {
        add(const AuthEvent.unauthenticated());
      },
    );
  }
}
