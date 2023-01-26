import 'package:domain/model/pageable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/application/dimen.dart';
import 'package:presentation/components/pagination/pagination.dart';

typedef IndexedPageWidgetBuilder<T extends Pageable> = Widget Function(BuildContext context, int index, T element);
typedef ErrorWidgetBuilder = Widget Function(BuildContext context, Object error);

enum _Type { listView, sliverList }

const double bottomHeight = 80;
const double bottomLoaderSize = 24;
const double bottomLoaderItemHeight = 48;
const double loadMoreThresholdFactor = 0.40;

class Pagination<T extends Pageable> extends StatefulWidget {
  const Pagination.listView({
    required this.loading,
    required this.empty,
    required this.errorWidgetBuilder,
    required this.indexedPageWidgetBuilder,
    this.indexedWidgetSeparatorBuilder,
    this.left = 0,
    this.top = 0,
    this.right = 0,
  })  : _type = _Type.listView,
        sliverAppBar = null;

  const Pagination.sliverList({
    required this.sliverAppBar,
    required this.loading,
    required this.empty,
    required this.errorWidgetBuilder,
    required this.indexedPageWidgetBuilder,
    this.left = 0,
    this.top = 0,
    this.right = 0,
  })  : _type = _Type.sliverList,
        indexedWidgetSeparatorBuilder = null;

  final Widget loading;
  final Widget empty;
  final ErrorWidgetBuilder errorWidgetBuilder;

  final SliverAppBar? sliverAppBar;
  final IndexedPageWidgetBuilder<T> indexedPageWidgetBuilder;
  final IndexedWidgetBuilder? indexedWidgetSeparatorBuilder;

  final _Type _type;

  final double left;
  final double top;
  final double right;

  @override
  _PaginationState createState() => _PaginationState<T>();
}

class _PaginationState<T extends Pageable> extends State<Pagination<T>> {
  late ScrollController _scrollController;

  @override
  void initState() {
    final bloc = context.read<PaginationBloc<T>>();
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        final threshold = MediaQuery.of(context).size.height * loadMoreThresholdFactor;
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.position.pixels;
        if (maxScroll - currentScroll <= threshold) {
          bloc.add(const PaginationEvent.loadNextPage());
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationBloc<T>, PaginationState<T>>(
      builder: (context, state) {
        if (state.isLoading) {
          return widget.loading;
        }
        if (state.hasError) {
          return widget.errorWidgetBuilder(context, state.error!);
        }
        if (state.items.isEmpty) {
          return widget.empty;
        }

        if (!state.isLoading && !state.hasError && state.items.isNotEmpty) {
          switch (widget._type) {
            case _Type.listView:
              return _PaginationListView<T>(
                state: state as PaginationLoadedState<T>,
                indexedPageWidgetBuilder: widget.indexedPageWidgetBuilder,
                separatorBuilder: widget.indexedWidgetSeparatorBuilder,
                scrollController: _scrollController,
                left: widget.left,
                top: widget.top,
                right: widget.right,
              );
            case _Type.sliverList:
              return _PaginationScrollView<T>(
                sliverAppBar: widget.sliverAppBar,
                state: state as PaginationLoadedState<T>,
                indexedPageWidgetBuilder: widget.indexedPageWidgetBuilder,
                scrollController: _scrollController,
                left: widget.left,
                top: widget.top,
                right: widget.right,
              );
          }
        }
        return Container();
      },
    );
  }
}

class _BottomLoader extends StatelessWidget {
  const _BottomLoader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Insets.large,
        horizontal: Insets.large,
      ),
      child: Container(
        height: bottomLoaderItemHeight,
        alignment: Alignment.center,
        child: const Center(
          child: SizedBox(
            width: bottomLoaderSize,
            height: bottomLoaderSize,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class _PaginationScrollView<T extends Pageable> extends StatelessWidget {
  const _PaginationScrollView({
    required this.state,
    required this.sliverAppBar,
    required this.scrollController,
    required this.indexedPageWidgetBuilder,
    this.left = Insets.large,
    this.top = Insets.small,
    this.right = Insets.large,
  });

  final SliverAppBar? sliverAppBar;
  final IndexedPageWidgetBuilder<T> indexedPageWidgetBuilder;
  final ScrollController scrollController;
  final PaginationLoadedState<T> state;

  final double left;
  final double top;
  final double right;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        if (sliverAppBar != null) sliverAppBar!,
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            vertical: Insets.large,
            horizontal: Insets.large,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index >= state.items.length && state.isLoadingMore) {
                  return const _BottomLoader();
                } else {
                  return indexedPageWidgetBuilder(context, index, state.items[index]);
                }
              },
              childCount: state.isLoadingMore ? state.items.length + 1 : state.items.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: bottomHeight),
        ),
      ],
    );
  }
}

class _PaginationListView<T extends Pageable> extends StatelessWidget {
  const _PaginationListView({
    required this.state,
    required this.indexedPageWidgetBuilder,
    required this.scrollController,
    this.separatorBuilder,
    this.left = Insets.large,
    this.top = Insets.small,
    this.right = Insets.large,
  });

  final PaginationLoadedState<T> state;
  final IndexedPageWidgetBuilder<T> indexedPageWidgetBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final ScrollController scrollController;

  final double left;
  final double top;
  final double right;

  @override
  Widget build(BuildContext context) {
    if (separatorBuilder != null) {
      return ListView.separated(
        padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottomHeight),
        controller: scrollController,
        itemCount: state.isLoadingMore ? state.items.length + 1 : state.items.length,
        itemBuilder: (context, index) {
          if (index >= state.items.length && state.isLoadingMore) {
            return const _BottomLoader();
          } else {
            return indexedPageWidgetBuilder(context, index, state.items[index]);
          }
        },
        separatorBuilder: separatorBuilder!,
      );
    } else {
      return ListView.builder(
        padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottomHeight),
        controller: scrollController,
        itemCount: state.isLoadingMore ? state.items.length + 1 : state.items.length,
        itemBuilder: (context, index) {
          if (index >= state.items.length && state.isLoadingMore) {
            return const _BottomLoader();
          } else {
            return indexedPageWidgetBuilder(context, index, state.items[index]);
          }
        },
      );
    }
  }
}
