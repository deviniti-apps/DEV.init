import 'package:domain/model/user.dart';
import 'package:domain/store/single_value_store.dart';
import 'package:domain/usecase/get_local_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockUserSingleValueStore extends Mock implements SingleValueStore<User> {}

void main() {
  group(
    'GetUserRemoteSourceAction',
    () {
      late MockUserSingleValueStore mockUserSingleValueStore;
      late GetLocalUserUsecase getLocalUserUsecase;

      setUp(
        () {
          mockUserSingleValueStore = MockUserSingleValueStore();

          getLocalUserUsecase = GetLocalUserUsecase(
            userSingleValueStore: mockUserSingleValueStore,
          );
        },
      );

      test(
        'Should return user when no error has occurred',
        () async {
          const user = User(
            name: 'name',
            email: 'email',
          );

          when(() => mockUserSingleValueStore.read()).thenReturn(TaskEither<SingleValueStoreFailure, User>.right(user));

          final result = await getLocalUserUsecase.execute().run();

          result.match(
            (it) => throw it,
            (it) => expect(it, user),
          );
        },
      );

      test(
        'Should return fatal error detail when getting local user fails',
        () async {
          when(() => mockUserSingleValueStore.read())
              .thenReturn(TaskEither<SingleValueStoreFailure, User>.left(SingleValueStoreFailure.fatal));

          final result = await getLocalUserUsecase.execute().run();

          result.match(
            (it) => expect(it, GetLocalUserFailure.fatal),
            (it) => throw it,
          );
        },
      );
    },
  );
}
