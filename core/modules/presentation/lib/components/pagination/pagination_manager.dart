import 'package:domain/model/pageable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class PaginationResult<T extends Pageable> {
  const PaginationResult({
    required this.items,
    required this.paginationKey,
    this.error,
  });

  final List<T> items;
  final int paginationKey;
  final Object? error;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PaginationResult<T> &&
            (identical(other.items, items) || const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.error, error) || const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.paginationKey, paginationKey) ||
                const DeepCollectionEquality().equals(other.paginationKey, paginationKey)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(paginationKey) ^
      const DeepCollectionEquality().hash(error) ^
      runtimeType.hashCode;
}

abstract class PaginationManager<T extends Pageable> {
  Future<PaginationResult<T>> getPages({
    required Object? filteringKey,
    required int paginationKey,
    // ignore: avoid_annotating_with_dynamic
    required dynamic config,
    required int pageSize,
  });
}
