import 'package:domain/model/user.dart';
import 'package:domain/store/single_value_store.dart';

abstract class AuthTokenProvider {
  late Future<String> token;
}

class AuthTokenProviderImpl extends AuthTokenProvider {
  AuthTokenProviderImpl({
    required SingleValueStore<User> userSingleValueStore,
  }) : _userSingleValueStore = userSingleValueStore;

  // ignore: unused_field
  final SingleValueStore<User> _userSingleValueStore;

  @override
  Future<String> get token async => '';
}
