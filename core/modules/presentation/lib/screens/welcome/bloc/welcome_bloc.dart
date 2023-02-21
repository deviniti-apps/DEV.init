import 'dart:async';

import 'package:domain/model/user.dart';
import 'package:domain/user_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/common/state_type.dart';
import 'package:presentation/screens/welcome/welcome_argument.dart';

part 'welcome_bloc.freezed.dart';

part 'welcome_event.dart';

part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc({
    required WelcomeArgument argument,
    required UserProvider userProvider,
  })  : _userProvider = userProvider,
        super(WelcomeState.initial(argument: argument)) {
    on<_OnInitiated>(_onInitiated);
    on<_OnLoggedIn>(_onLoggedIn);
  }

  final UserProvider _userProvider;

  Future<void> _onInitiated(_OnInitiated event, Emitter<WelcomeState> emit) async {}

  Future<void> _onLoggedIn(_OnLoggedIn event, Emitter<WelcomeState> emit) async {
    emit(state.copyWith(type: StateType.loading));

    const user = User(name: 'name', email: 'email');
    final newState = await _userProvider
        .updateUser(user)
        .match(
          (_) => state.copyWith(type: StateType.error),
          (_) => state.copyWith(type: StateType.success),
        )
        .run();

    emit(newState);
  }
}
