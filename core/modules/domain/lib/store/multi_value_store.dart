import 'dart:convert';

import 'package:domain/store/adapter/storage_adapter.dart';
import 'package:domain/store/storable.dart';
import 'package:fpdart/fpdart.dart';

class MultiValueStore<T extends Storable> {
  const MultiValueStore({
    required StorageAdapter adapter,
    required String key,
    required T Function(Map<String, dynamic> json) fromJson,
    bool clearOnCorruptedRead = true,
    bool allowDuplicates = false,
  })  : assert(null is! T),
        _adapter = adapter,
        _key = key,
        _fromJson = fromJson,
        _clearOnCorruptedRead = clearOnCorruptedRead,
        _allowDuplicates = allowDuplicates;

  /// The underlying persistence mechanism which will be used by this store.
  final StorageAdapter _adapter;

  /// App-wide unique key used to separate data between stores which use the same storage adapter.
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
  final bool _clearOnCorruptedRead;

  /// When set to true, values added via add() or addAll() will not be checked for uniqueness
  /// meaning that the store will possibly contain duplicated values.
  ///
  /// Default to false.
  final bool _allowDuplicates;

  /// Adds a single value to the stored collection.
  ///
  /// The prepend param may be used to put the value at the end of the collection (default behaviour, false)
  /// or at the start of the collection (true).
  ///
  /// When the store is configured to clear corrupted data upon reads, it has a side-effect of clearing the store
  /// when the stored data is corrupted or no longer adheres to current T.
  ///
  /// Returns true if the value was added to the store (meaning the store was modified).
  ///
  /// Returns false when the store is configured not to accept duplicates and the value is already in the store
  /// (meaning the store was not modified).
  Future<bool> add({required T value, bool prepend = false}) async {
    final previousValues = await getAll();
    if (!_allowDuplicates && previousValues.contains(value)) {
      return false;
    }
    final updatedValues = prepend ? previousValues.prepend(value) : previousValues.append(value);
    await _write(updatedValues);
    return true;
  }

  /// Adds a collection of values to the stored collection.
  ///
  /// The prepend param may be used to put these values at the end of the collection (default behaviour, false)
  /// or at the start of the collection (true).
  ///
  /// When the store is configured to clear corrupted data upon reads, it has a side-effect of clearing the store
  /// when the stored data is corrupted or no longer adheres to current T.
  ///
  /// Returns true if any of the provided values was added to the store (meaning the store was modified).
  ///
  /// Returns false when the store is configured not to accept duplicates and all provided values are
  /// already in the store (meaning the store was not modified).
  Future<bool> addAll({required Iterable<T> values, bool prepend = false}) async {
    final previousValues = await getAll();
    final newValues = _allowDuplicates ? values : values.where((element) => !previousValues.contains(element));
    if (!_allowDuplicates && newValues.isEmpty) {
      return false;
    }
    final updatedValues = prepend ? [...newValues, ...previousValues] : [...previousValues, ...newValues];
    await _write(updatedValues);
    return true;
  }

  /// Attempts to retrieve the entire collection of values from the store as a ListList&lt;T&gt;.
  ///
  /// Returns an empty list when there is no stored data, currently stored data is corrupted or currently
  /// stored data no longer adheres to a structurally modified T.
  ///
  /// When _clearOnCorruptedRead is true, it will automatically call removeAll() to improve the efficiency
  /// of subsequent reads.
  Future<List<T>> getAll() async {
    final value = await _adapter.read(key: _key);
    if (value == null || value.isEmpty) {
      return const [];
    }
    try {
      return (jsonDecode(value) as List<dynamic>)
          .map((value) => _fromJson(value as Map<String, dynamic>))
          .toList(growable: false);
      // Deserialization Exceptions and Errors are expected here when the model is changed
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      if (_clearOnCorruptedRead) {
        await removeAll();
      }
      return const [];
    }
  }

  /// Removes a single value from the store.
  ///
  /// Returns true when the value was removed (meaning the store was modified).
  ///
  /// Returns false when such value was not in the store (meaning the store was not modified).
  Future<bool> remove({required T value}) async {
    final previousValues = await getAll();
    if (!previousValues.contains(value)) {
      return false;
    }
    await _write(previousValues.where((element) => element != value));
    return true;
  }

  /// Removes all values from the store.
  Future<void> removeAll() => _adapter.delete(key: _key);

  Future<void> _write(Iterable<T> iterable) => _adapter.write(
        key: _key,
        value: jsonEncode(iterable.map((value) => value.toJson()).toList(growable: false)),
      );
}
