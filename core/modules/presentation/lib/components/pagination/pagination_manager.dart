import 'package:domain/model/pageable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class PaginationResult<T extends Pageable> {
  const PaginationResult({
    required this.items,
    required this.paginationKey,
  });

  final List<T> items;
  final int paginationKey;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PaginationResult<T> &&
            (identical(other.items, items) || const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.paginationKey, paginationKey) ||
                const DeepCollectionEquality().equals(other.paginationKey, paginationKey)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(paginationKey) ^
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
