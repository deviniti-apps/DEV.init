import 'package:domain/preference_assistant/preference_assistant.dart';

class UserStore {
  UserStore({PreferenceAssistant? secureStorage}) : _secureStorage = secureStorage;

  static const String _storageKeyToken = 'token';

  final PreferenceAssistant? _secureStorage;

  Future<String> getToken() async {
    return await _secureStorage?.read(key: _storageKeyToken) ?? '';
  }

  Future<void> putToken({required String token}) async {
    await _secureStorage?.write(key: _storageKeyToken, value: token);
  }

  Future<bool> clear() async => await _secureStorage?.deleteAll() ?? false;
}
