import 'package:domain/model/user.dart';
import 'package:remote/mapper/mapper.dart';
import 'package:remote/models/user/user_remote_model.dart';

class UserRemoteToUserMapper implements Mapper<UserRemoteModel, User> {
  const UserRemoteToUserMapper();

  @override
  User map(UserRemoteModel element) {
    return User(
      name: element.name,
      email: element.email,
    );
  }
}
