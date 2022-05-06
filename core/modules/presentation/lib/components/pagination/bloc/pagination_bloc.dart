import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/model/pageable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/components/pagination/pagination.dart';

part 'pagination_bloc.freezed.dart';
part 'pagination_event.dart';
part 'pagination_state.dart';

class PaginationBloc<T extends Pageable> extends Bloc<PaginationEvent, PaginationState<T>> {
  PaginationBloc({required PaginationManager<T> paginationManager})
      : _paginationManager = paginationManager,
        super(PaginationState.initial()) {
    on<PaginationEvent>(onEachEvent, transformer: sequential());
  }

  final PaginationManager<T> _paginationManager;

  Future<void> onEachEvent(PaginationEvent event, Emitter<PaginationState<T>> emit) async {
    await event.map(
      replace: (value) async {
        final newPages = state.items.mapIndexed(
          (index, element) {
            if (index == value.index) {
              return value.pageable as T;
            } else {
              return element;
            }
          },
        ).toList();

        emit(state.copyWith(items: newPages));
      },
      remove: (value) async {
        final newPages = [...state.items]..removeAt(value.index);
        emit(
          state.copyWith(
            filteringKey: state.filteringKey,
            paginationKey: state.paginationKey,
            items: newPages,
            hasReachedMax: newPages.length < state.pageSize,
            isLoadingMore: false,
            isLoading: false,
            config: state.config,
          ),
        );
      },
      refresh: (_) async {
        await _onRefresh(emit);
      },
      loadFirstPage: (value) async {
        await _onFirstPage(value, emit);
      },
      loadNextPage: (value) async {
        await _onNextPage(value, emit);
      },
    );
  }

  Future<void> _onRefresh(Emitter<PaginationState<T>> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
        isLoadingMore: false,
        hasReachedMax: false,
        error: null,
        items: [],
        paginationKey: 0,
      ),
    );

    final result = await _paginationManager.getPages(
      filteringKey: state.filteringKey,
      paginationKey: 0,
      config: state.config,
      pageSize: state.pageSize,
    );

    emit(
      state.copyWith(
        filteringKey: state.filteringKey,
        paginationKey: result.paginationKey,
        items: result.items,
        hasReachedMax: result.items.length < state.pageSize,
        isLoadingMore: false,
        isLoading: false,
        config: state.config,
      ),
    );
  }

  Future<void> _onFirstPage(_PaginationLoadFirstPage event, Emitter<PaginationState<T>> emit) async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
          isLoadingMore: false,
          hasReachedMax: false,
          error: null,
          items: [],
          paginationKey: 0,
          pageSize: event.pageSize,
        ),
      );

      final result = await _paginationManager.getPages(
        filteringKey: event.filteringKey,
        paginationKey: 0,
        config: event.config,
        pageSize: event.pageSize,
      );

      emit(
        state.copyWith(
          filteringKey: event.filteringKey,
          paginationKey: result.paginationKey,
          items: result.items,
          hasReachedMax: result.items.length < event.pageSize,
          isLoadingMore: false,
          isLoading: false,
          config: event.config,
          pageSize: event.pageSize,
          error: result.error,
        ),
      );
    } on Exception catch (e) {
      emit(state.copyWith(error: e, isLoading: false));
    }
  }

  Future<void> _onNextPage(_PaginationLoadNextPage event, Emitter<PaginationState<T>> emit) async {
    if (!state.hasReachedMax) {
      emit(state.copyWith(isLoadingMore: true));
      final result = await _paginationManager.getPages(
        filteringKey: state.filteringKey,
        paginationKey: state.paginationKey,
        config: state.config,
        pageSize: event.pageSize,
      );
      if (result.items.isNotEmpty) {
        emit(
          state.copyWith(
            items: List.from(state.items)..addAll(result.items),
            paginationKey: result.paginationKey,
            hasReachedMax: false,
            isLoadingMore: false,
            error: result.error,
            pageSize: event.pageSize,
          ),
        );
      } else {
        emit(
          state.copyWith(
            hasReachedMax: true,
            isLoadingMore: false,
            isLoading: false,
            error: result.error,
            pageSize: event.pageSize,
          ),
        );
      }
    }
  }
}
