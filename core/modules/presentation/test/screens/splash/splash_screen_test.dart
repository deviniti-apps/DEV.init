import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:presentation/components/auth/bloc/auth_bloc.dart';
import 'package:presentation/screens/splash/splash_screen.dart';

import '../../testable_material_app.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class FakeAuthEvent extends Fake implements AuthEvent {}

class FakeAuthState extends Fake implements AuthState {}

void main() {
  group(
    'SplashScreen',
    () {
      late MockAuthBloc mockAuthBloc;
      late MockNavigator mockNavigator;
      setUpAll(
        () {
          registerFallbackValue(FakeAuthEvent());
          registerFallbackValue(FakeAuthState());
        },
      );

      setUp(
        () {
          mockAuthBloc = MockAuthBloc();
          mockNavigator = MockNavigator();
        },
      );

      tearDown(
        () {
          reset(mockAuthBloc);
          reset(mockNavigator);
        },
      );

      testWidgets(
        'Should push dashboard page when button is tapped',
        (tester) async {
          // arrange
          final initialState = AuthState.initial();

          when(
            () => mockNavigator.pushNamedAndRemoveUntil(
              any(that: equals('/dashboard')),
              any(),
            ),
          ).thenAnswer((_) async {});
          when(() => mockAuthBloc.state).thenReturn(initialState.copyWith(isAuthenticated: true));

          // find
          final startText = find.text('Start');
          final button = find.byType(TextButton);

          // test
          await tester.pumpWidget(
            BlocProvider<AuthBloc>(
              create: (context) => mockAuthBloc,
              child: TestableMaterialApp(
                child: MockNavigatorProvider(
                  navigator: mockNavigator,
                  child: const SplashScreen(),
                ),
              ),
            ),
          );

          await tester.pump();

          await tester.tap(button);

          // verify
          verify(
            () => mockNavigator.pushNamedAndRemoveUntil(
              any(that: equals('/dashboard')),
              any(),
            ),
          ).called(1);

          verify(() => mockAuthBloc.add(any(that: isA<AuthEventAuthenticated>()))).called(1);

          // expect
          expect(startText, findsOneWidget);
          expect(button, findsOneWidget);
        },
      );
    },
  );
}
