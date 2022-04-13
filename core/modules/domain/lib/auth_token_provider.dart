import 'package:domain/store/user_store.dart';

abstract class AuthTokenProvider {
  late Future<String> token;
}

class AuthTokenProviderImpl extends AuthTokenProvider {
  AuthTokenProviderImpl({
    required UserStore userStore,
  }) : _userStore = userStore;

  // ignore: unused_field
  final UserStore _userStore;

  @override
  Future<String> get token async => '';
}
