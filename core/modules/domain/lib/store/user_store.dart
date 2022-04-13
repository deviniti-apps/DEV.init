import 'dart:convert';

import 'package:domain/model/user.dart';
import 'package:domain/preference_assistant/preference_assistant.dart';

class UserStore {
  static const String _userKey = '4e49e858-3b76-41a1-9101-7b46c709eb88';

  const UserStore({
    required PreferenceAssistant preferences,
  }) : _preferences = preferences;

  final PreferenceAssistant _preferences;

  Future<bool> clear() => _preferences.deleteAll();

  Future<void> putUserData({required User value}) {
    final map = {
      'name': value.name,
      'email': value.email,
    };
    return _preferences.write<String>(key: _userKey, value: jsonEncode(map));
  }

  Future<User?> getUser() async {
    final value = _preferences.read<String>(key: _userKey);
    if (value == null) {
      return null;
    }

    final userData = jsonDecode(value) as Map<String, dynamic>;

    return User(
      name: userData['name'] as String,
      email: userData['email'] as String,
    );
  }
}
