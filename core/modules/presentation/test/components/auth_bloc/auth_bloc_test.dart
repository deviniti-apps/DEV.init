// ignore_for_file: avoid_annotating_with_dynamic

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:domain/model/user.dart';
import 'package:domain/user_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/common/state_type.dart';
import 'package:presentation/components/auth/bloc/auth_bloc.dart';

class MockUserProvider extends Mock implements UserProvider {}

class MockUserStream extends Mock implements Stream<User?> {}

class MockUserStreamSubscription extends Mock implements StreamSubscription<User?> {}

void main() {
  late MockUserProvider mockUserProvider;
  late MockUserStream mockUserStream;
  late MockUserStreamSubscription mockUserStreamSubscription;
  late AuthBloc bloc;

  const user = User(
    name: 'name',
    email: 'email',
  );

  setUp(
    () {
      mockUserProvider = MockUserProvider();
      mockUserStream = MockUserStream();
      mockUserStreamSubscription = MockUserStreamSubscription();
      bloc = AuthBloc(
        userProvider: mockUserProvider,
      );
    },
  );

  blocTest<AuthBloc, AuthState>(
    'on AuthEvent.onInitiated emits update of null user and userStateType '
    'when fetching user returns error',
    build: () {
      when(() => mockUserProvider.userStream).thenAnswer((_) => mockUserStream);
      when(() => mockUserStream.listen(any(), onError: any(named: 'onError')))
          .thenAnswer((_) => mockUserStreamSubscription);
      when(() => mockUserStream.listen(any(), onError: any(named: 'onError'))).thenAnswer((realInvocation) {
        final onError = realInvocation.namedArguments[const Symbol('onError')] as Function(dynamic)?;
        onError?.call(null);
        return mockUserStreamSubscription;
      });
      when(() => mockUserStreamSubscription.cancel()).thenAnswer((_) async {});
      when(() => mockUserProvider.restoreUser()).thenAnswer((_) async {});
      return bloc;
    },
    act: (bloc) => bloc.add(const AuthEvent.onInitiated()),
    verify: (bloc) => expect(bloc.state.isLoggedIn, false),
    expect: () => [
      AuthState.initial().copyWith(
        userStateType: StateType.loaded,
        user: null,
      ),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'on AuthEvent.onInitiated emits update of user and userStateType '
    'when fetching user returns no error',
    build: () {
      when(() => mockUserProvider.userStream).thenAnswer((_) => mockUserStream);
      when(() => mockUserStream.listen(any(), onError: any(named: 'onError')))
          .thenAnswer((_) => mockUserStreamSubscription);
      when(() => mockUserStream.listen(any(), onError: any(named: 'onError'))).thenAnswer((realInvocation) {
        final callback = realInvocation.positionalArguments.first as Function(User?);
        callback(user);
        return mockUserStreamSubscription;
      });
      when(() => mockUserStreamSubscription.cancel()).thenAnswer((_) async {});
      when(() => mockUserProvider.restoreUser()).thenAnswer((_) async {});
      return bloc;
    },
    act: (bloc) => bloc.add(const AuthEvent.onInitiated()),
    verify: (bloc) => expect(bloc.state.isLoggedIn, true),
    expect: () => [
      AuthState.initial().copyWith(
        userStateType: StateType.loaded,
        user: user,
      ),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'on AuthEvent.onInitiated emits update of user and userStateType '
    'when user is null',
    build: () => bloc,
    act: (bloc) => bloc.add(const AuthEvent.onUserUpdated(null)),
    expect: () => [
      AuthState.initial().copyWith(
        userStateType: StateType.loaded,
        user: null,
      ),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'on AuthEvent.onInitiated emits update of user and userStateType '
    'when user is not null',
    build: () => bloc,
    act: (bloc) => bloc.add(const AuthEvent.onUserUpdated(user)),
    expect: () => [
      AuthState.initial().copyWith(
        userStateType: StateType.loaded,
        user: user,
      ),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'on AuthEvent.onAuthCheckRequested emits nothing '
    'when user wants to refresh user',
    build: () {
      when(() => mockUserProvider.restoreUser()).thenAnswer((_) async {});
      return bloc;
    },
    act: (bloc) => bloc.add(const AuthEvent.onAuthCheckRequested()),
    expect: () => [],
  );

  blocTest<AuthBloc, AuthState>(
    'on AuthEvent.onSignedOut emits nothing '
    'when user wants to sign out',
    build: () {
      when(() => mockUserProvider.deleteUser()).thenAnswer((_) async {});
      return bloc;
    },
    act: (bloc) => bloc.add(const AuthEvent.onSignedOut()),
    expect: () => [],
  );
}
