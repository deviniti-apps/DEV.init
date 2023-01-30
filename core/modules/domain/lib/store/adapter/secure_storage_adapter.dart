import 'package:domain/store/adapter/storage_adapter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageAdapter extends StorageAdapter {
  const SecureStorageAdapter({
    required FlutterSecureStorage flutterSecureStorage,
  }) : _flutterSecureStorage = flutterSecureStorage;

  final FlutterSecureStorage _flutterSecureStorage;

  @override
  Future<void> delete({required String key}) => _flutterSecureStorage.delete(key: key);

  @override
  Future<String?> read({required String key}) async => _flutterSecureStorage.read(key: key);

  @override
  Future<void> write({required String key, required String value}) =>
      _flutterSecureStorage.write(key: key, value: value);
}
