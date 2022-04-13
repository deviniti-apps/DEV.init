// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:domain/unauth_stream_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/components/auth/bloc/auth_bloc.dart';

class MockUnAuthStreamProvider extends Mock implements UnAuthStreamProvider {}

class MockUnAuthSubscription extends Mock implements StreamSubscription<Unit> {}

class MockUnAuthStream extends Mock implements Stream<Unit> {}

void main() {
  late MockUnAuthStreamProvider mockUnAuthStreamProvider;
  late MockUnAuthSubscription mockUnAuthSubscription;
  late MockUnAuthStream mockUnAuthStream;

  setUp(
    () {
      mockUnAuthStreamProvider = MockUnAuthStreamProvider();
      mockUnAuthSubscription = MockUnAuthSubscription();
      mockUnAuthStream = MockUnAuthStream();
    },
  );

  AuthBloc _build() {
    return AuthBloc(
      unAuthStreamProvider: mockUnAuthStreamProvider,
    );
  }

  blocTest<AuthBloc, AuthState>(
    'On AuthEvent.started() it subscribes to au auth stream '
    'then emits not authenticated',
    build: _build,
    setUp: () {
      when(() => mockUnAuthStreamProvider.stream).thenAnswer((_) => mockUnAuthStream);
      when(() => mockUnAuthStream.listen(any())).thenAnswer((_) => mockUnAuthSubscription);

      when(() => mockUnAuthStreamProvider.stream).thenAnswer((_) => mockUnAuthStream);
      when(() => mockUnAuthStream.listen(any())).thenAnswer((realInvocation) {
        final callback = realInvocation.positionalArguments.first;
        callback(unit);
        return mockUnAuthSubscription;
      });
    },
    act: (bloc) {
      bloc.add(const AuthEvent.started());
    },
    expect: () => [
      AuthState.initial().copyWith(
        isAuthenticated: false,
      )
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'On AuthEvent.authenticated() it changes state to be authenticated and activated ',
    build: _build,
    act: (bloc) {
      bloc.add(const AuthEvent.authenticated());
    },
    expect: () => [
      AuthState.initial().copyWith(
        isAuthenticated: true,
      ),
    ],
  );
}
