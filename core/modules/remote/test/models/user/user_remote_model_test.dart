import 'package:remote/models/user/user_remote_model.dart';
import 'package:test/test.dart';

void main() {
  group(
    'UserRemoteModel',
    () {
      const user = UserRemoteModel(
        id: 0,
        name: 'name',
        email: 'email',
      );

      final jsonMap = <String, dynamic>{
        'id': 0,
        'name': 'name',
        'email': 'email',
      };

      test(
        'should create user remote model from json',
        () async {
          final result = UserRemoteModel.fromJson(jsonMap);

          expect(result, user);
        },
      );

      test(
        'should create json from user remote model',
        () async {
          final result = user.toJson();

          expect(result, jsonMap);
        },
      );
    },
  );
}
