import 'package:domain/store/user_store.dart';

abstract class AuthTokenProvider {
  late Future<String> token;
}

class AuthTokenProviderImpl extends AuthTokenProvider {
  AuthTokenProviderImpl({required UserStore userStore}) : _userStore = userStore;

  final UserStore _userStore;

  @override
  Future<String> get token => _userStore.getToken();
}
