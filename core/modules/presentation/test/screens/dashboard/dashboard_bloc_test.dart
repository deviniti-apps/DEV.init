import 'package:bloc_test/bloc_test.dart';
import 'package:domain/model/user.dart';
import 'package:domain/usecase/get_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/common/state_type.dart';
import 'package:presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:presentation/screens/dashboard/dashboard_argument.dart';

class MockGetUserUsecase extends Mock implements GetUserUsecase {}

void main() {
  const DashboardArgument argument = DashboardArgument();
  late MockGetUserUsecase mockGetUserUsecase;
  late DashboardBloc bloc;

  setUp(
    () {
      mockGetUserUsecase = MockGetUserUsecase();
      bloc = DashboardBloc(
        argument: argument,
        getUserUsecase: mockGetUserUsecase,
      );
    },
  );

  blocTest<DashboardBloc, DashboardState>(
    'On DashboardEvent.started() should emit state with user when there is no error',
    build: () => bloc,
    act: (bloc) {
      bloc.add(const DashboardEvent.started());
    },
    setUp: () {
      when(mockGetUserUsecase.execute).thenAnswer((_) => TaskEither.right(user));
    },
    verify: (bloc) {
      verify(mockGetUserUsecase.execute).called(1);
    },
    expect: () => [
      DashboardState.initial(argument: argument).copyWith(type: StateType.loading),
      DashboardState.initial(argument: argument).copyWith(
        type: StateType.loaded,
        user: user,
      ),
    ],
  );

  blocTest<DashboardBloc, DashboardState>(
    'On DashboardEvent.started() should emit state with error when there is error while getting current user',
    build: () => bloc,
    act: (bloc) {
      bloc.add(const DashboardEvent.started());
    },
    setUp: () {
      when(mockGetUserUsecase.execute).thenAnswer((_) => TaskEither.left(GetUserFailure.fatal));
    },
    verify: (bloc) {
      verify(mockGetUserUsecase.execute).called(1);
    },
    expect: () => [
      DashboardState.initial(argument: argument).copyWith(type: StateType.loading),
      DashboardState.initial(argument: argument).copyWith(
        type: StateType.error,
        user: null,
      ),
    ],
  );
}

const user = User(
  name: 'John Doe',
  email: 'john.doe@example.com',
);
