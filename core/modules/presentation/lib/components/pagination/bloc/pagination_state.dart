part of 'pagination_bloc.dart';

@freezed
class PaginationState<T extends Pageable> with _$PaginationState<T> {
  const factory PaginationState({
    required Object? error,
    required bool isLoading,
    required bool isLoadingMore,
    required bool hasReachedMax,
    required int paginationKey,
    required int pageSize,
    required Object? filteringKey,
    required Object? config,
    required List<T> items,
  }) = PaginationLoadedState<T>;

  factory PaginationState.initial() {
    return PaginationState<T>(
      error: null,
      isLoading: false,
      isLoadingMore: false,
      hasReachedMax: false,
      paginationKey: 0,
      pageSize: defaultPageSize,
      filteringKey: null,
      config: null,
      items: [],
    );
  }
}

extension $_PaginationState on PaginationState {
  bool get hasError => error != null;
}
