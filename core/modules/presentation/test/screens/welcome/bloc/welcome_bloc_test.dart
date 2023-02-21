import 'package:bloc_test/bloc_test.dart';
import 'package:domain/model/user.dart';
import 'package:domain/usecase/update_local_user_usecase.dart';
import 'package:domain/user_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/common/state_type.dart';
import 'package:presentation/screens/welcome/bloc/welcome_bloc.dart';
import 'package:presentation/screens/welcome/welcome_argument.dart';

class MockUserProvider extends Mock implements UserProvider {}

void main() {
  late MockUserProvider mockUserProvider;
  late WelcomeBloc bloc;

  const argument = WelcomeArgument();
  const user = User(
    name: 'name',
    email: 'email',
  );

  setUp(
    () {
      mockUserProvider = MockUserProvider();
      bloc = WelcomeBloc(
        argument: argument,
        userProvider: mockUserProvider,
      );
    },
  );

  blocTest<WelcomeBloc, WelcomeState>(
    'on WelcomeEvent.onInitiated emits nothing',
    build: () => bloc,
    act: (bloc) => bloc.add(const WelcomeEvent.onInitiated()),
    expect: () => [],
  );

  blocTest<WelcomeBloc, WelcomeState>(
    'on WelcomeEvent.onLoggedIn emits update of type '
    'when updating user returns UpdateLocalUserFailure.fatal error',
    build: () {
      when(() => mockUserProvider.updateUser(user)).thenAnswer((_) => TaskEither.left(UpdateLocalUserFailure.fatal));
      return bloc;
    },
    seed: () => WelcomeState.initial(argument: argument).copyWith(
      type: StateType.loaded,
    ),
    act: (bloc) => bloc.add(const WelcomeEvent.onLoggedIn()),
    expect: () => [
      WelcomeState.initial(argument: argument).copyWith(
        type: StateType.loading,
      ),
      WelcomeState.initial(argument: argument).copyWith(
        type: StateType.error,
      ),
    ],
  );

  blocTest<WelcomeBloc, WelcomeState>(
    'on WelcomeEvent.onLoggedIn emits update of type '
    'when updating user returns no error',
    build: () {
      when(() => mockUserProvider.updateUser(user)).thenAnswer((_) => TaskEither.right(unit));
      return bloc;
    },
    seed: () => WelcomeState.initial(argument: argument).copyWith(
      type: StateType.loaded,
    ),
    act: (bloc) => bloc.add(const WelcomeEvent.onLoggedIn()),
    expect: () => [
      WelcomeState.initial(argument: argument).copyWith(
        type: StateType.loading,
      ),
      WelcomeState.initial(argument: argument).copyWith(
        type: StateType.success,
      ),
    ],
  );
}
