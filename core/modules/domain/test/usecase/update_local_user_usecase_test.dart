import 'package:domain/model/user.dart';
import 'package:domain/store/single_value_store.dart';
import 'package:domain/usecase/update_local_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockUserSingleValueStore extends Mock implements SingleValueStore<User> {}

void main() {
  group(
    'UpdateUserRemoteSourceAction',
    () {
      late MockUserSingleValueStore mockUserSingleValueStore;
      late UpdateLocalUserUsecase updateLocalUserUsecase;

      setUp(
        () {
          mockUserSingleValueStore = MockUserSingleValueStore();

          updateLocalUserUsecase = UpdateLocalUserUsecase(
            userSingleValueStore: mockUserSingleValueStore,
          );
        },
      );

      const user = User(
        name: 'name',
        email: 'email',
      );

      test(
        'Should return unit when no error has occurred',
        () async {
          when(() => mockUserSingleValueStore.write(value: user))
              .thenReturn(TaskEither<SingleValueStoreFailure, Unit>.right(unit));

          final result = await updateLocalUserUsecase.execute(param: user).run();

          result.match(
            (it) => throw it,
            (it) => expect(it, unit),
          );
        },
      );

      test(
        'Should return fatal error detail when updating local user fails',
        () async {
          when(() => mockUserSingleValueStore.write(value: user))
              .thenReturn(TaskEither<SingleValueStoreFailure, Unit>.left(SingleValueStoreFailure.fatal));

          final result = await updateLocalUserUsecase.execute(param: user).run();

          result.match(
            (it) => expect(it, UpdateLocalUserFailure.fatal),
            (it) => throw it,
          );
        },
      );
    },
  );
}
