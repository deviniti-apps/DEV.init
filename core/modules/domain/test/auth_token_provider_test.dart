import 'package:domain/auth_token_provider.dart';
import 'package:domain/model/user.dart';
import 'package:domain/store/single_value_store.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockUserSingleValueStore extends Mock implements SingleValueStore<User> {}

void main() {
  group(
    'AuthTokenProvider',
    () {
      late MockUserSingleValueStore mockUserSingleValueStore;
      late AuthTokenProvider authTokenProvider;

      const token = '';

      setUp(
        () {
          mockUserSingleValueStore = MockUserSingleValueStore();
          authTokenProvider = AuthTokenProviderImpl(
            userSingleValueStore: mockUserSingleValueStore,
          );
        },
      );

      test(
        'Should call .token and return token from UserSingleValueStore',
        () async {
          final result = await authTokenProvider.token;
          expect(result, token);
        },
      );
    },
  );
}
