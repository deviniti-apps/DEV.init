import 'package:domain/model/user.dart';
import 'package:remote/mapper/user_remote_to_user_mapper.dart';
import 'package:remote/models/user/user_remote_model.dart';
import 'package:test/test.dart';

void main() {
  group(
    'UserRemoteToUserMapper',
    () {
      late UserRemoteToUserMapper userRemoteToUserMapper;

      setUp(
        () => userRemoteToUserMapper = const UserRemoteToUserMapper(),
      );

      test(
        'should correctly map remote model to domain model',
        () {
          const userRemoteModel = UserRemoteModel(
            id: 0,
            name: 'name',
            email: 'email',
          );

          const user = User(
            name: 'name',
            email: 'email',
          );

          final result = userRemoteToUserMapper.map(userRemoteModel);

          expect(result, user);
        },
      );
    },
  );
}
