import 'dart:async';

import 'package:domain/model/user.dart';
import 'package:domain/user_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/common/state_type.dart';

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required UserProvider userProvider,
  })  : _userProvider = userProvider,
        super(AuthState.initial()) {
    on<_OnInitiated>(_onInitiated);
    on<_OnUserUpdated>(_onUserUpdated);
    on<_OnAuthCheckRequested>(_onAuthCheckRequested);
    on<_OnSignedOut>(_onSignedOut);
  }

  final UserProvider _userProvider;

  StreamSubscription<User?>? _userStreamSubscription;

  Future<void> _onInitiated(_OnInitiated event, Emitter<AuthState> emit) async {
    await _userStreamSubscription?.cancel();
    _userStreamSubscription = _userProvider.userStream.listen(
      (customerProfile) => add(AuthEvent.onUserUpdated(customerProfile)),
      onError: (_) => add(const AuthEvent.onUserUpdated(null)),
    );
    await _userProvider.restoreUser();
  }

  Future<void> _onUserUpdated(_OnUserUpdated event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        userStateType: StateType.loaded,
        user: event.user,
      ),
    );
  }

  Future<void> _onAuthCheckRequested(_OnAuthCheckRequested event, Emitter<AuthState> emit) async =>
      _userProvider.restoreUser();

  Future<void> _onSignedOut(_OnSignedOut event, Emitter<AuthState> emit) async => _userProvider.deleteUser();

  @override
  Future<void> close() async {
    await _userStreamSubscription?.cancel();
    return super.close();
  }
}
