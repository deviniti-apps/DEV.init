import 'package:domain/store/adapter/storage_adapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter extends StorageAdapter {
  const SharedPreferencesAdapter({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> delete({required String key}) => _sharedPreferences.remove(key);

  @override
  Future<String?> read({required String key}) async => _sharedPreferences.getString(key);

  @override
  Future<void> write({required String key, required String value}) => _sharedPreferences.setString(key, value);
}
