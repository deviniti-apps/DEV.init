import 'package:bloc_test/bloc_test.dart';
import 'package:domain/model/pageable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/components/pagination/pagination.dart';

@immutable
class PaginationItem implements Pageable {
  const PaginationItem(this.index);

  final int index;

  @override
  String toString() {
    return 'PI: $index';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is PaginationItem && runtimeType == other.runtimeType && index == other.index;

  @override
  int get hashCode => index.hashCode;
}

class MockPaginationManager extends Mock implements PaginationManager<PaginationItem> {}

final firstPage = _items(15);
final firstPageA = _items(10);
final secondPageA = _items(10, 10);

List<PaginationItem> _items(int count, [int shift = 0]) {
  return List.generate(count, (index) => PaginationItem(index + shift));
}

void main() {
  late MockPaginationManager paginationManager;

  setUp(
    () {
      paginationManager = MockPaginationManager();
    },
  );

  tearDown(
    () {
      reset(paginationManager);
    },
  );

  PaginationBloc<PaginationItem> buildBloc() {
    return PaginationBloc<PaginationItem>(paginationManager: paginationManager);
  }

  blocTest<PaginationBloc<PaginationItem>, PaginationState<PaginationItem>>(
    'On PaginationEvent.loadFirstPage() emits PaginationState with items: [firstPage]',
    build: buildBloc,
    setUp: () {
      when(
        () => paginationManager.getPages(
          filteringKey: any(named: 'filteringKey'),
          paginationKey: 0,
          config: any(named: 'config'),
          pageSize: any(named: 'pageSize'),
        ),
      ).thenAnswer((_) async => PaginationResult(items: firstPage, paginationKey: 15));
    },
    act: (bloc) {
      // ignore: avoid_redundant_argument_values
      bloc.add(const PaginationEvent.loadFirstPage(pageSize: 20, filteringKey: null, config: null));
    },
    verify: (bloc) {
      expect(bloc.state.items.length, 15);
    },
    expect: () => [
      isA<PaginationLoadedState<PaginationItem>>().having((it) => it.isLoading, 'isLoading', true),
      isA<PaginationLoadedState<PaginationItem>>()
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.filteringKey, 'filteringKey', null)
          .having((it) => it.paginationKey, 'paginationKey', 15)
          .having((it) => it.items, 'items', firstPage)
          .having((it) => it.hasReachedMax, 'hasReachedMax', true)
          .having((it) => it.isLoadingMore, 'isLoadingMore', false)
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.config, 'config', null),
    ],
  );

  blocTest<PaginationBloc<PaginationItem>, PaginationState<PaginationItem>>(
    'On PaginationEvent.loadFirstPage() emits PaginationState with hasError true when exception has been raised',
    build: buildBloc,
    setUp: () {
      when(
        () => paginationManager.getPages(
          filteringKey: any(named: 'filteringKey'),
          paginationKey: any(named: 'paginationKey'),
          config: any(named: 'config'),
          pageSize: any(named: 'pageSize'),
        ),
      ).thenThrow(Exception(''));
    },
    act: (bloc) {
      // ignore: avoid_redundant_argument_values
      bloc.add(const PaginationEvent.loadFirstPage(pageSize: 20, filteringKey: null, config: null));
    },
    verify: (bloc) {
      expect(bloc.state.items.length, 0);
    },
    expect: () => [
      isA<PaginationLoadedState<PaginationItem>>().having((it) => it.isLoading, 'isLoading', true),
      isA<PaginationLoadedState<PaginationItem>>()
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.paginationKey, 'paginationKey', 0)
          .having((it) => it.hasError, 'hasError', true),
    ],
  );

  blocTest<PaginationBloc<PaginationItem>, PaginationState<PaginationItem>>(
    'On PaginationEvent.loadFirstPage(pageSize: 10, filteringKey: null, config: null) and PaginationEvent.loadNextPage(pageSize: 10) '
    'emits states loading state, loaded state with first page and finally state with next page',
    build: buildBloc,
    setUp: () {
      when(
        () => paginationManager.getPages(
          filteringKey: any(named: 'filteringKey'),
          paginationKey: 0,
          config: any(named: 'config'),
          pageSize: any(named: 'pageSize'),
        ),
      ).thenAnswer((_) async => PaginationResult(items: firstPageA, paginationKey: 10));

      when(
        () => paginationManager.getPages(
          filteringKey: any(named: 'filteringKey'),
          paginationKey: 10,
          config: any(named: 'config'),
          pageSize: any(named: 'pageSize'),
        ),
      ).thenAnswer((_) async => PaginationResult(items: secondPageA, paginationKey: 20));
    },
    act: (bloc) {
      bloc
        // ignore: avoid_redundant_argument_values
        ..add(const PaginationEvent.loadFirstPage(pageSize: 10, filteringKey: null, config: null))
        ..add(const PaginationEvent.loadNextPage(pageSize: 10));
    },
    expect: () => [
      isA<PaginationLoadedState<PaginationItem>>().having((it) => it.isLoading, 'isLoading', true),
      isA<PaginationLoadedState<PaginationItem>>()
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.filteringKey, 'filteringKey', null)
          .having((it) => it.paginationKey, 'paginationKey', 10)
          .having((it) => it.items, 'items', firstPageA)
          .having((it) => it.hasReachedMax, 'hasReachedMax', false)
          .having((it) => it.isLoadingMore, 'isLoadingMore', false)
          .having((it) => it.config, 'config', null),
      isA<PaginationLoadedState<PaginationItem>>()
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.filteringKey, 'filteringKey', null)
          .having((it) => it.paginationKey, 'paginationKey', 10)
          .having((it) => it.items, 'items', firstPageA)
          .having((it) => it.hasReachedMax, 'hasReachedMax', false)
          .having((it) => it.isLoadingMore, 'isLoadingMore', true)
          .having((it) => it.config, 'config', null),
      isA<PaginationLoadedState<PaginationItem>>()
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.filteringKey, 'filteringKey', null)
          .having((it) => it.paginationKey, 'paginationKey', 20)
          .having((it) => it.items, 'items', [...firstPageA, ...secondPageA])
          .having((it) => it.hasReachedMax, 'hasReachedMax', false)
          .having((it) => it.isLoadingMore, 'isLoadingMore', false)
          .having((it) => it.config, 'config', null),
    ],
  );

  blocTest<PaginationBloc<PaginationItem>, PaginationState<PaginationItem>>(
    'On PaginationEvent.refresh() emits PaginationState with items: [firstPage]',
    build: buildBloc,
    setUp: () {
      when(
        () => paginationManager.getPages(
          filteringKey: any(named: 'filteringKey'),
          paginationKey: 0,
          config: any(named: 'config'),
          pageSize: 10,
        ),
      ).thenAnswer((_) async => PaginationResult(items: firstPageA, paginationKey: 10));
    },
    act: (bloc) {
      bloc.add(const PaginationEvent.refresh());
    },
    verify: (bloc) {
      expect(bloc.state.items.length, 10);
    },
    expect: () => [
      isA<PaginationLoadedState<PaginationItem>>().having((it) => it.isLoading, 'isLoading', true),
      isA<PaginationLoadedState<PaginationItem>>()
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.filteringKey, 'filteringKey', null)
          .having((it) => it.paginationKey, 'paginationKey', 10)
          .having((it) => it.items, 'items', firstPageA)
          .having((it) => it.hasReachedMax, 'hasReachedMax', false)
          .having((it) => it.isLoadingMore, 'isLoadingMore', false)
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.pageSize, 'pageSize', 10)
          .having((it) => it.config, 'config', null),
    ],
  );

  blocTest<PaginationBloc<PaginationItem>, PaginationState<PaginationItem>>(
    'On PaginationEvent.loadFirstPage() and PaginationEvent.remove(index: 5) '
    'emits state with first page and then state with removed fifth element',
    build: buildBloc,
    setUp: () {
      when(
        () => paginationManager.getPages(
          filteringKey: any(named: 'filteringKey'),
          paginationKey: 0,
          config: any(named: 'config'),
          pageSize: 21,
        ),
      ).thenAnswer((_) async => PaginationResult(items: firstPage, paginationKey: 15));
    },
    act: (bloc) {
      bloc
        // ignore: avoid_redundant_argument_values
        ..add(const PaginationEvent.loadFirstPage(pageSize: 21, filteringKey: null, config: null))
        ..add(const PaginationEvent.remove(index: 5));
    },
    expect: () => [
      isA<PaginationLoadedState<PaginationItem>>().having((it) => it.isLoading, 'isLoading', true),
      isA<PaginationLoadedState<PaginationItem>>()
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.filteringKey, 'filteringKey', null)
          .having((it) => it.paginationKey, 'paginationKey', 15)
          .having((it) => it.items, 'items', firstPage)
          .having((it) => it.hasReachedMax, 'hasReachedMax', true)
          .having((it) => it.isLoadingMore, 'isLoadingMore', false)
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.config, 'config', null),
      isA<PaginationLoadedState<PaginationItem>>()
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.filteringKey, 'filteringKey', null)
          .having((it) => it.paginationKey, 'paginationKey', 15)
          .having((it) => it.items, 'items', firstPage..removeAt(5))
          .having((it) => it.hasReachedMax, 'hasReachedMax', true)
          .having((it) => it.isLoadingMore, 'isLoadingMore', false)
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.config, 'config', null),
    ],
  );

  blocTest<PaginationBloc<PaginationItem>, PaginationState<PaginationItem>>(
    'On PaginationEvent.loadFirstPage() and PaginationEvent.replace(index: 5, pageable: PaginationItem(100) '
    'emits state with first page and then state with removed fifth element',
    build: buildBloc,
    setUp: () {
      when(
        () => paginationManager.getPages(
          filteringKey: any(named: 'filteringKey'),
          paginationKey: 0,
          config: any(named: 'config'),
          pageSize: 21,
        ),
      ).thenAnswer((_) async => PaginationResult(items: firstPage, paginationKey: 15));
    },
    act: (bloc) {
      bloc
        // ignore: avoid_redundant_argument_values
        ..add(const PaginationEvent.loadFirstPage(pageSize: 21, filteringKey: null, config: null))
        ..add(const PaginationEvent.replace(index: 5, pageable: PaginationItem(100)));
    },
    expect: () => [
      isA<PaginationLoadedState<PaginationItem>>().having((it) => it.isLoading, 'isLoading', true),
      isA<PaginationLoadedState<PaginationItem>>()
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.filteringKey, 'filteringKey', null)
          .having((it) => it.paginationKey, 'paginationKey', 15)
          .having((it) => it.items, 'items', firstPage)
          .having((it) => it.hasReachedMax, 'hasReachedMax', true)
          .having((it) => it.isLoadingMore, 'isLoadingMore', false)
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.config, 'config', null),
      isA<PaginationLoadedState<PaginationItem>>()
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.filteringKey, 'filteringKey', null)
          .having((it) => it.paginationKey, 'paginationKey', 15)
          .having(
            (it) => it.items,
            'items',
            firstPage
              ..removeAt(5)
              ..insert(5, const PaginationItem(100)),
          )
          .having((it) => it.hasReachedMax, 'hasReachedMax', true)
          .having((it) => it.isLoadingMore, 'isLoadingMore', false)
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.config, 'config', null),
    ],
  );

  blocTest<PaginationBloc<PaginationItem>, PaginationState<PaginationItem>>(
    'On PaginationEvent.loadFirstPage() and PaginationEvent.loadNextPage(pageSize: 15) '
    'emits state with first page and hasReachedMax true',
    build: buildBloc,
    seed: () => PaginationLoadedState<PaginationItem>(
      error: null,
      isLoading: false,
      isLoadingMore: false,
      hasReachedMax: false,
      paginationKey: 1,
      pageSize: 15,
      filteringKey: null,
      config: null,
      items: firstPage,
    ),
    setUp: () {
      when(
        () => paginationManager.getPages(
          filteringKey: any(named: 'filteringKey'),
          paginationKey: 1,
          config: any(named: 'config'),
          pageSize: 15,
        ),
      ).thenAnswer((_) async => const PaginationResult(items: <PaginationItem>[], paginationKey: 1));
    },
    act: (bloc) {
      bloc.add(const PaginationEvent.loadNextPage(pageSize: 15));
    },
    expect: () => [
      isA<PaginationLoadedState<PaginationItem>>()
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.filteringKey, 'filteringKey', null)
          .having((it) => it.paginationKey, 'paginationKey', 1)
          .having((it) => it.pageSize, 'pageSize', 15)
          .having((it) => it.items, 'items', firstPage)
          .having((it) => it.hasReachedMax, 'hasReachedMax', false)
          .having((it) => it.isLoadingMore, 'isLoadingMore', true)
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.config, 'config', null),

      isA<PaginationLoadedState<PaginationItem>>()
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.filteringKey, 'filteringKey', null)
          .having((it) => it.paginationKey, 'paginationKey', 1)
          .having((it) => it.pageSize, 'paginationKey', 15)
          .having((it) => it.items, 'items', firstPage)
          .having((it) => it.hasReachedMax, 'hasReachedMax', true)
          .having((it) => it.isLoadingMore, 'isLoadingMore', false)
          .having((it) => it.isLoading, 'isLoading', false)
          .having((it) => it.config, 'config', null),
    ],
  );
}
