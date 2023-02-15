import 'dart:convert';

import 'package:domain/store/adapter/storage_adapter.dart';
import 'package:domain/store/storable.dart';
import 'package:foundation/foundation.dart';
import 'package:fpdart/fpdart.dart';

enum SingleValueStoreFailure { fatal, notFound }

class SingleValueStore<T extends Storable> {
  const SingleValueStore({
    required StorageAdapter adapter,
    required String key,
    required T Function(Map<String, dynamic> json) fromJson,
    bool removeWhenInvalid = true,
  })  : assert(null is! T),
        _adapter = adapter,
        _key = key,
        _fromJson = fromJson,
        _removeWhenInvalid = removeWhenInvalid;

  /// The underlying persistence mechanism which will be used by this store.
  final StorageAdapter _adapter;

  /// App-wide unique key used to separate data between stores.
  final String _key;

  /// De-serialization function used to convert stored JSON objects into instances of T.
  final T Function(Map<String, dynamic> json) _fromJson;

  /// Whether data, which is deemed invalid upon read, either because of store corruption or a T structure change,
  /// will be removed from the store for better efficiency upon subsequent reads.
  ///
  /// Setting to false will allow for corrupted data to be retrieved by a custom external mechanism in order to
  /// attempt to fix it or make it adhere to the structurally changed T.
  ///
  /// Defaults to true.
  final bool _removeWhenInvalid;

  /// Writes provided value to the store.
  ///
  /// Will overwrite the currently stored value, so there is no need to call delete() and write() separately.
  TaskEither<SingleValueStoreFailure, Unit> write({required T value}) => tryCatchE<SingleValueStoreFailure, Unit>(
        () async {
          await _adapter.write(key: _key, value: jsonEncode(value.toJson()));
          return right(unit);
        },
        (_, __) => SingleValueStoreFailure.fatal,
      );

  /// Attempts to read the currently stored value as an instance of T.
  ///
  /// Returns SingleValueStoreFailure.notFound when there is no stored data, currently stored data is corrupted or currently stored data
  /// no longer adheres to a structurally modified T.
  ///
  /// When _removeWhenInvalid is true, it will automatically call delete() to improve the efficiency of subsequent reads.
  TaskEither<SingleValueStoreFailure, T> read() => tryCatchE<SingleValueStoreFailure, T>(
        () async {
          final value = await _adapter.read(key: _key);
          if (value == null) {
            return left(SingleValueStoreFailure.notFound);
          }
          final object = _fromJson(jsonDecode(value) as Map<String, dynamic>);
          return right(object);
        },
        onErrorRun: () async {
          if (_removeWhenInvalid) {
            await delete().run();
          }
        },
        (_, __) => SingleValueStoreFailure.fatal,
      );

  /// Deletes the currently stored value from the store.
  TaskEither<SingleValueStoreFailure, Unit> delete() => tryCatchE<SingleValueStoreFailure, Unit>(
        () async {
          await _adapter.delete(key: _key);
          return right(unit);
        },
        (_, __) => SingleValueStoreFailure.fatal,
      );
}
