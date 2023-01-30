import 'package:domain/model/user.dart';
import 'package:domain/store/single_value_store.dart';

abstract class AuthTokenProvider {
  late Future<String> token;
}

class AuthTokenProviderImpl extends AuthTokenProvider {
  AuthTokenProviderImpl({
    required SingleValueStore<User> userStore,
  }) : _userStore = userStore;

  // ignore: unused_field
  final SingleValueStore<User> _userStore;

  @override
  Future<String> get token async => '';
}
