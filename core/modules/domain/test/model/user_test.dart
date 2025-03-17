import 'package:domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'User',
    () {
      const user = User(
        name: 'name',
        email: 'email',
      );

      test(
        'should create user model from Json',
        () {
          final jsonMap = <String, dynamic>{
            'name': 'name',
            'email': 'email',
          };
          final result = User.fromJson(jsonMap);

          expect(result, user);
        },
      );
    },
  );
}
