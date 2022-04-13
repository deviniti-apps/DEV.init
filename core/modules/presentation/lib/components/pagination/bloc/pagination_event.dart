part of 'pagination_bloc.dart';

const defaultPageSize = 10;

@freezed
class PaginationEvent with _$PaginationEvent {
  const factory PaginationEvent.replace({required int index, required Pageable pageable}) = _PaginationReplace;

  const factory PaginationEvent.remove({required int index}) = _PaginationRemove;

  const factory PaginationEvent.refresh() = _PaginationRefresh;

  const factory PaginationEvent.loadFirstPage({
    @Default(defaultPageSize) int pageSize,
    Object? filteringKey,
    Object? config,
  }) = _PaginationLoadFirstPage;

  const factory PaginationEvent.loadNextPage({
    @Default(defaultPageSize) int pageSize,
  }) = _PaginationLoadNextPage;
}
