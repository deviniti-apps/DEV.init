abstract class StorageAdapter {
  const StorageAdapter();

  Future<String?> read({required String key});
  Future<void> write({required String key, required String value});
  Future<void> delete({required String key});
}
