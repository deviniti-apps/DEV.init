import 'package:domain/store/user_store.dart';

abstract class AuthenticationService {
  Future<bool> isAuthenticated();
}

class AuthenticationServiceImpl implements AuthenticationService {
  AuthenticationServiceImpl({
    required UserStore userStore,
  }) : _userStore = userStore;

  final UserStore _userStore;

  @override
  Future<bool> isAuthenticated() async {
    final token = await _userStore.getToken();
    return token.isNotEmpty;
  }
}
