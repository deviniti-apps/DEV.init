import 'package:domain/model/user.dart';
import 'package:domain/usecase/delete_local_user_usecase.dart';
import 'package:domain/usecase/get_local_user_usecase.dart';
import 'package:domain/usecase/update_local_user_usecase.dart';
import 'package:domain/user_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockGetLocalUserUsecase extends Mock implements GetLocalUserUsecase {}

class MockDeleteLocalUserUsecase extends Mock implements DeleteLocalUserUsecase {}

class MockUpdateLocalUserUsecase extends Mock implements UpdateLocalUserUsecase {}

void main() {
  group(
    'UserProvider',
    () {
      late MockGetLocalUserUsecase mockGetLocalUserUsecase;
      late MockDeleteLocalUserUsecase mockDeleteLocalUserUsecase;
      late MockUpdateLocalUserUsecase mockUpdateLocalUserUsecase;
      late UserProvider authTokenProvider;

      setUpAll(
        () {
          mockGetLocalUserUsecase = MockGetLocalUserUsecase();
          mockDeleteLocalUserUsecase = MockDeleteLocalUserUsecase();
          mockUpdateLocalUserUsecase = MockUpdateLocalUserUsecase();
          authTokenProvider = UserProviderImpl(
            getLocalUserUsecase: mockGetLocalUserUsecase,
            deleteLocalUserUsecase: mockDeleteLocalUserUsecase,
            updateLocalUserUsecase: mockUpdateLocalUserUsecase,
          );
        },
      );

      const user = User(
        name: 'name',
        email: 'email',
      );

      group(
        'restoreUser',
        () {
          test(
            'Should return user when no error occurred',
            () async {
              when(() => mockGetLocalUserUsecase.execute()).thenAnswer((_) => TaskEither.right(user));

              await authTokenProvider.restoreUser();

              verifyNever(() => mockDeleteLocalUserUsecase.execute().run());
            },
          );

          test(
            'Should call deleteUser when restoreUser returns GetLocalUserFailure.fatal error',
            () async {
              when(() => mockGetLocalUserUsecase.execute())
                  .thenAnswer((_) => TaskEither.left(GetLocalUserFailure.fatal));
              when(() => mockDeleteLocalUserUsecase.execute()).thenAnswer((_) => TaskEither.right(unit));

              await authTokenProvider.restoreUser();

              verify(() => mockDeleteLocalUserUsecase.execute().run()).called(1);
            },
          );
        },
      );

      group(
        'updateUser',
        () {
          test(
            'Should return unit when no error occurred',
            () async {
              when(() => mockUpdateLocalUserUsecase.execute(param: user)).thenAnswer((_) => TaskEither.right(unit));

              final result = await authTokenProvider.updateUser(user).run();

              expect(result, const Right<UpdateLocalUserFailure, Unit>(unit));
            },
          );

          test(
            'Should return UpdateLocalUserFailure.fatal when error occurred',
            () async {
              when(() => mockUpdateLocalUserUsecase.execute(param: user))
                  .thenAnswer((_) => TaskEither.left(UpdateLocalUserFailure.fatal));

              final result = await authTokenProvider.updateUser(user).run();

              expect(result, const Left<UpdateLocalUserFailure, Unit>(UpdateLocalUserFailure.fatal));
            },
          );
        },
      );

      group(
        'deleteUser',
        () {
          test(
            'Should delete local user from',
            () async {
              when(() => mockDeleteLocalUserUsecase.execute()).thenAnswer((_) => TaskEither.right(unit));

              await authTokenProvider.deleteUser();

              verify(() => mockDeleteLocalUserUsecase.execute().run()).called(1);
            },
          );
        },
      );

      group(
        'userStream',
        () {
          test(
            'Should return userStream with user as first value',
            () async {
              when(() => mockGetLocalUserUsecase.execute()).thenAnswer((_) => TaskEither.right(user));
              await authTokenProvider.restoreUser();

              final result = authTokenProvider.userStream;
              expect(await result.first, user);
            },
          );

          test(
            'Should return userStream with null as first value',
            () async {
              when(() => mockGetLocalUserUsecase.execute())
                  .thenAnswer((_) => TaskEither.left(GetLocalUserFailure.fatal));
              when(() => mockDeleteLocalUserUsecase.execute()).thenAnswer((_) => TaskEither.right(unit));
              await authTokenProvider.restoreUser();

              final result = authTokenProvider.userStream;
              expect(await result.first, null);
            },
          );
        },
      );

      group(
        'user',
        () {
          test(
            'Should return User when streamControler is not empty',
            () async {
              when(() => mockGetLocalUserUsecase.execute()).thenAnswer((_) => TaskEither.right(user));
              await authTokenProvider.restoreUser();
              final result = authTokenProvider.user;
              expect(result, user);
            },
          );

          test(
            'Should return null when streamControler is empty',
            () async {
              when(() => mockGetLocalUserUsecase.execute())
                  .thenAnswer((_) => TaskEither.left(GetLocalUserFailure.fatal));
              when(() => mockDeleteLocalUserUsecase.execute()).thenAnswer((_) => TaskEither.right(unit));
              await authTokenProvider.restoreUser();
              final result = authTokenProvider.user;
              expect(result, null);
            },
          );
        },
      );
    },
  );
}
