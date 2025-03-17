import 'package:domain/model/user.dart';
import 'package:domain/store/single_value_store.dart';
import 'package:domain/usecase/delete_local_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockUserSingleValueStore extends Mock implements SingleValueStore<User> {}

void main() {
  group(
    'DeleteUserRemoteSourceAction',
    () {
      late MockUserSingleValueStore mockUserSingleValueStore;
      late DeleteLocalUserUsecase deleteLocalUserUsecase;

      setUp(
        () {
          mockUserSingleValueStore = MockUserSingleValueStore();

          deleteLocalUserUsecase = DeleteLocalUserUsecase(
            userSingleValueStore: mockUserSingleValueStore,
          );
        },
      );

      test(
        'Should return unit when no error has occurred',
        () async {
          when(() => mockUserSingleValueStore.delete())
              .thenReturn(TaskEither<SingleValueStoreFailure, Unit>.right(unit));

          final result = await deleteLocalUserUsecase.execute().run();

          result.match(
            (it) => throw it,
            (it) => expect(it, unit),
          );
        },
      );

      test(
        'Should return fatal error detail when deleting local user fails',
        () async {
          when(() => mockUserSingleValueStore.delete())
              .thenReturn(TaskEither<SingleValueStoreFailure, Unit>.left(SingleValueStoreFailure.fatal));

          final result = await deleteLocalUserUsecase.execute().run();

          result.match(
            (it) => expect(it, DeleteLocalUserFailure.fatal),
            (it) => throw it,
          );
        },
      );
    },
  );
}
