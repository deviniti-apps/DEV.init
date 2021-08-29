import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceAssistant {
  PreferenceAssistant({SharedPreferences? sharedPreferences}) : _sharedPreferences = sharedPreferences;

  final SharedPreferences? _sharedPreferences;

  Future<bool> write<@required T>({required String key, required T value}) async {
    if (value is String) {
      return await _sharedPreferences?.setString(key, value) ?? false;
    } else if (value is bool) {
      return await _sharedPreferences?.setBool(key, value) ?? false;
    }
    return false;
  }

  T? read<@required T>({required String key}) {
    if (!(_sharedPreferences?.containsKey(key) ?? false)) {
      return null;
    }
    if (T == String) {
      // ignore: avoid_as
      return _sharedPreferences?.getString(key) as T;
    } else if (T == bool) {
      // ignore: avoid_as
      return _sharedPreferences?.getBool(key) as T;
    }
    return null;
  }

  Future<bool> deleteAll() async => await _sharedPreferences?.clear() ?? false;
}
