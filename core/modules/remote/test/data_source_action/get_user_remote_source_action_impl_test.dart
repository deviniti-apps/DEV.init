import 'package:domain/model/error_detail.dart';
import 'package:domain/model/user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:remote/api/user_rest_api.dart';
import 'package:remote/data_source_action/get_user_remote_source_action_impl.dart';
import 'package:remote/mapper/mapper.dart';
import 'package:remote/models/user/user_remote_model.dart';
import 'package:remote/other/error/error_converter.dart';
import 'package:test/test.dart';

class MockUserRestApi extends Mock implements UserRestApi {}

class MockErrorConverter extends Mock implements ErrorConverter {}

class MockUserRemoteToUserMapper extends Mock implements Mapper<UserRemoteModel, User> {}

class FakeUser extends Fake implements User {}

class FakeUserRemoteModel extends Fake implements UserRemoteModel {}

class FakeStackTrace extends Fake implements StackTrace {}

class FakeError extends Fake implements Object {}

void main() {
  group(
    'GetUserRemoteSourceAction',
    () {
      late MockUserRestApi mockUserRestApi;
      late MockErrorConverter mockErrorConverter;
      late MockUserRemoteToUserMapper mockUserRemoteToUserMapper;
      late GetUserRemoteSourceActionImpl getUserRemoteSourceActionImpl;

      setUpAll(
        () {
          registerFallbackValue(FakeUser());
          registerFallbackValue(FakeUserRemoteModel());
          registerFallbackValue(FakeStackTrace());
          registerFallbackValue(FakeError());
        },
      );

      setUp(
        () {
          mockUserRestApi = MockUserRestApi();
          mockErrorConverter = MockErrorConverter();
          mockUserRemoteToUserMapper = MockUserRemoteToUserMapper();

          getUserRemoteSourceActionImpl = GetUserRemoteSourceActionImpl(
            userRestApi: mockUserRestApi,
            errorConverter: mockErrorConverter,
            userRemoteToUserMapper: mockUserRemoteToUserMapper,
          );
        },
      );

      test(
        'Should return user when no error has occurred',
        () async {
          const user = User(name: 'name', email: 'name@example.com');
          const remoteUser = UserRemoteModel(id: 1, name: 'name', email: 'name@example.com');

          when(() => mockUserRemoteToUserMapper.map(any(that: equals(remoteUser)))).thenReturn(user);
          when(() => mockUserRestApi.getCurrentUser()).thenAnswer((_) async => remoteUser);

          final result = await getUserRemoteSourceActionImpl.execute().run();

          result.match(
            (it) => throw it,
            (it) => expect(it, user),
          );
        },
      );

      test(
        'Should return fatal error detail when getting current user fails',
        () async {
          when(() => mockUserRestApi.getCurrentUser()).thenThrow(Exception('Error'));
          when(() => mockErrorConverter.handleRemoteError(any(), any())).thenReturn(ErrorDetail.fatal());

          final result = await getUserRemoteSourceActionImpl.execute().run();

          result.match(
            (it) => expect(it, ErrorDetail.fatal()),
            (it) => throw it,
          );
        },
      );
    },
  );
}
