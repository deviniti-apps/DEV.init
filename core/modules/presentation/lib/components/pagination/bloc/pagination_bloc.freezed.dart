// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pagination_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaginationEventTearOff {
  const _$PaginationEventTearOff();

  _PaginationReplace replace({required int index, required Pageable pageable}) {
    return _PaginationReplace(
      index: index,
      pageable: pageable,
    );
  }

  _PaginationRemove remove({required int index}) {
    return _PaginationRemove(
      index: index,
    );
  }

  _PaginationRefresh refresh() {
    return const _PaginationRefresh();
  }

  _PaginationLoadFirstPage loadFirstPage(
      {int pageSize = defaultPageSize, Object? filteringKey, Object? config}) {
    return _PaginationLoadFirstPage(
      pageSize: pageSize,
      filteringKey: filteringKey,
      config: config,
    );
  }

  _PaginationLoadNextPage loadNextPage({int pageSize = defaultPageSize}) {
    return _PaginationLoadNextPage(
      pageSize: pageSize,
    );
  }
}

/// @nodoc
const $PaginationEvent = _$PaginationEventTearOff();

/// @nodoc
mixin _$PaginationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, Pageable pageable) replace,
    required TResult Function(int index) remove,
    required TResult Function() refresh,
    required TResult Function(
            int pageSize, Object? filteringKey, Object? config)
        loadFirstPage,
    required TResult Function(int pageSize) loadNextPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int index, Pageable pageable)? replace,
    TResult Function(int index)? remove,
    TResult Function()? refresh,
    TResult Function(int pageSize, Object? filteringKey, Object? config)?
        loadFirstPage,
    TResult Function(int pageSize)? loadNextPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, Pageable pageable)? replace,
    TResult Function(int index)? remove,
    TResult Function()? refresh,
    TResult Function(int pageSize, Object? filteringKey, Object? config)?
        loadFirstPage,
    TResult Function(int pageSize)? loadNextPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaginationReplace value) replace,
    required TResult Function(_PaginationRemove value) remove,
    required TResult Function(_PaginationRefresh value) refresh,
    required TResult Function(_PaginationLoadFirstPage value) loadFirstPage,
    required TResult Function(_PaginationLoadNextPage value) loadNextPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PaginationReplace value)? replace,
    TResult Function(_PaginationRemove value)? remove,
    TResult Function(_PaginationRefresh value)? refresh,
    TResult Function(_PaginationLoadFirstPage value)? loadFirstPage,
    TResult Function(_PaginationLoadNextPage value)? loadNextPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaginationReplace value)? replace,
    TResult Function(_PaginationRemove value)? remove,
    TResult Function(_PaginationRefresh value)? refresh,
    TResult Function(_PaginationLoadFirstPage value)? loadFirstPage,
    TResult Function(_PaginationLoadNextPage value)? loadNextPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationEventCopyWith<$Res> {
  factory $PaginationEventCopyWith(
          PaginationEvent value, $Res Function(PaginationEvent) then) =
      _$PaginationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PaginationEventCopyWithImpl<$Res>
    implements $PaginationEventCopyWith<$Res> {
  _$PaginationEventCopyWithImpl(this._value, this._then);

  final PaginationEvent _value;
  // ignore: unused_field
  final $Res Function(PaginationEvent) _then;
}

/// @nodoc
abstract class _$PaginationReplaceCopyWith<$Res> {
  factory _$PaginationReplaceCopyWith(
          _PaginationReplace value, $Res Function(_PaginationReplace) then) =
      __$PaginationReplaceCopyWithImpl<$Res>;
  $Res call({int index, Pageable pageable});
}

/// @nodoc
class __$PaginationReplaceCopyWithImpl<$Res>
    extends _$PaginationEventCopyWithImpl<$Res>
    implements _$PaginationReplaceCopyWith<$Res> {
  __$PaginationReplaceCopyWithImpl(
      _PaginationReplace _value, $Res Function(_PaginationReplace) _then)
      : super(_value, (v) => _then(v as _PaginationReplace));

  @override
  _PaginationReplace get _value => super._value as _PaginationReplace;

  @override
  $Res call({
    Object? index = freezed,
    Object? pageable = freezed,
  }) {
    return _then(_PaginationReplace(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      pageable: pageable == freezed
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
    ));
  }
}

/// @nodoc

class _$_PaginationReplace implements _PaginationReplace {
  const _$_PaginationReplace({required this.index, required this.pageable});

  @override
  final int index;
  @override
  final Pageable pageable;

  @override
  String toString() {
    return 'PaginationEvent.replace(index: $index, pageable: $pageable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationReplace &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.pageable, pageable) ||
                other.pageable == pageable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, pageable);

  @JsonKey(ignore: true)
  @override
  _$PaginationReplaceCopyWith<_PaginationReplace> get copyWith =>
      __$PaginationReplaceCopyWithImpl<_PaginationReplace>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, Pageable pageable) replace,
    required TResult Function(int index) remove,
    required TResult Function() refresh,
    required TResult Function(
            int pageSize, Object? filteringKey, Object? config)
        loadFirstPage,
    required TResult Function(int pageSize) loadNextPage,
  }) {
    return replace(index, pageable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int index, Pageable pageable)? replace,
    TResult Function(int index)? remove,
    TResult Function()? refresh,
    TResult Function(int pageSize, Object? filteringKey, Object? config)?
        loadFirstPage,
    TResult Function(int pageSize)? loadNextPage,
  }) {
    return replace?.call(index, pageable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, Pageable pageable)? replace,
    TResult Function(int index)? remove,
    TResult Function()? refresh,
    TResult Function(int pageSize, Object? filteringKey, Object? config)?
        loadFirstPage,
    TResult Function(int pageSize)? loadNextPage,
    required TResult orElse(),
  }) {
    if (replace != null) {
      return replace(index, pageable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaginationReplace value) replace,
    required TResult Function(_PaginationRemove value) remove,
    required TResult Function(_PaginationRefresh value) refresh,
    required TResult Function(_PaginationLoadFirstPage value) loadFirstPage,
    required TResult Function(_PaginationLoadNextPage value) loadNextPage,
  }) {
    return replace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PaginationReplace value)? replace,
    TResult Function(_PaginationRemove value)? remove,
    TResult Function(_PaginationRefresh value)? refresh,
    TResult Function(_PaginationLoadFirstPage value)? loadFirstPage,
    TResult Function(_PaginationLoadNextPage value)? loadNextPage,
  }) {
    return replace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaginationReplace value)? replace,
    TResult Function(_PaginationRemove value)? remove,
    TResult Function(_PaginationRefresh value)? refresh,
    TResult Function(_PaginationLoadFirstPage value)? loadFirstPage,
    TResult Function(_PaginationLoadNextPage value)? loadNextPage,
    required TResult orElse(),
  }) {
    if (replace != null) {
      return replace(this);
    }
    return orElse();
  }
}

abstract class _PaginationReplace implements PaginationEvent {
  const factory _PaginationReplace(
      {required int index, required Pageable pageable}) = _$_PaginationReplace;

  int get index;
  Pageable get pageable;
  @JsonKey(ignore: true)
  _$PaginationReplaceCopyWith<_PaginationReplace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PaginationRemoveCopyWith<$Res> {
  factory _$PaginationRemoveCopyWith(
          _PaginationRemove value, $Res Function(_PaginationRemove) then) =
      __$PaginationRemoveCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$PaginationRemoveCopyWithImpl<$Res>
    extends _$PaginationEventCopyWithImpl<$Res>
    implements _$PaginationRemoveCopyWith<$Res> {
  __$PaginationRemoveCopyWithImpl(
      _PaginationRemove _value, $Res Function(_PaginationRemove) _then)
      : super(_value, (v) => _then(v as _PaginationRemove));

  @override
  _PaginationRemove get _value => super._value as _PaginationRemove;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_PaginationRemove(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PaginationRemove implements _PaginationRemove {
  const _$_PaginationRemove({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'PaginationEvent.remove(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationRemove &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  _$PaginationRemoveCopyWith<_PaginationRemove> get copyWith =>
      __$PaginationRemoveCopyWithImpl<_PaginationRemove>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, Pageable pageable) replace,
    required TResult Function(int index) remove,
    required TResult Function() refresh,
    required TResult Function(
            int pageSize, Object? filteringKey, Object? config)
        loadFirstPage,
    required TResult Function(int pageSize) loadNextPage,
  }) {
    return remove(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int index, Pageable pageable)? replace,
    TResult Function(int index)? remove,
    TResult Function()? refresh,
    TResult Function(int pageSize, Object? filteringKey, Object? config)?
        loadFirstPage,
    TResult Function(int pageSize)? loadNextPage,
  }) {
    return remove?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, Pageable pageable)? replace,
    TResult Function(int index)? remove,
    TResult Function()? refresh,
    TResult Function(int pageSize, Object? filteringKey, Object? config)?
        loadFirstPage,
    TResult Function(int pageSize)? loadNextPage,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaginationReplace value) replace,
    required TResult Function(_PaginationRemove value) remove,
    required TResult Function(_PaginationRefresh value) refresh,
    required TResult Function(_PaginationLoadFirstPage value) loadFirstPage,
    required TResult Function(_PaginationLoadNextPage value) loadNextPage,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PaginationReplace value)? replace,
    TResult Function(_PaginationRemove value)? remove,
    TResult Function(_PaginationRefresh value)? refresh,
    TResult Function(_PaginationLoadFirstPage value)? loadFirstPage,
    TResult Function(_PaginationLoadNextPage value)? loadNextPage,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaginationReplace value)? replace,
    TResult Function(_PaginationRemove value)? remove,
    TResult Function(_PaginationRefresh value)? refresh,
    TResult Function(_PaginationLoadFirstPage value)? loadFirstPage,
    TResult Function(_PaginationLoadNextPage value)? loadNextPage,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _PaginationRemove implements PaginationEvent {
  const factory _PaginationRemove({required int index}) = _$_PaginationRemove;

  int get index;
  @JsonKey(ignore: true)
  _$PaginationRemoveCopyWith<_PaginationRemove> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PaginationRefreshCopyWith<$Res> {
  factory _$PaginationRefreshCopyWith(
          _PaginationRefresh value, $Res Function(_PaginationRefresh) then) =
      __$PaginationRefreshCopyWithImpl<$Res>;
}

/// @nodoc
class __$PaginationRefreshCopyWithImpl<$Res>
    extends _$PaginationEventCopyWithImpl<$Res>
    implements _$PaginationRefreshCopyWith<$Res> {
  __$PaginationRefreshCopyWithImpl(
      _PaginationRefresh _value, $Res Function(_PaginationRefresh) _then)
      : super(_value, (v) => _then(v as _PaginationRefresh));

  @override
  _PaginationRefresh get _value => super._value as _PaginationRefresh;
}

/// @nodoc

class _$_PaginationRefresh implements _PaginationRefresh {
  const _$_PaginationRefresh();

  @override
  String toString() {
    return 'PaginationEvent.refresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PaginationRefresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, Pageable pageable) replace,
    required TResult Function(int index) remove,
    required TResult Function() refresh,
    required TResult Function(
            int pageSize, Object? filteringKey, Object? config)
        loadFirstPage,
    required TResult Function(int pageSize) loadNextPage,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int index, Pageable pageable)? replace,
    TResult Function(int index)? remove,
    TResult Function()? refresh,
    TResult Function(int pageSize, Object? filteringKey, Object? config)?
        loadFirstPage,
    TResult Function(int pageSize)? loadNextPage,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, Pageable pageable)? replace,
    TResult Function(int index)? remove,
    TResult Function()? refresh,
    TResult Function(int pageSize, Object? filteringKey, Object? config)?
        loadFirstPage,
    TResult Function(int pageSize)? loadNextPage,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaginationReplace value) replace,
    required TResult Function(_PaginationRemove value) remove,
    required TResult Function(_PaginationRefresh value) refresh,
    required TResult Function(_PaginationLoadFirstPage value) loadFirstPage,
    required TResult Function(_PaginationLoadNextPage value) loadNextPage,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PaginationReplace value)? replace,
    TResult Function(_PaginationRemove value)? remove,
    TResult Function(_PaginationRefresh value)? refresh,
    TResult Function(_PaginationLoadFirstPage value)? loadFirstPage,
    TResult Function(_PaginationLoadNextPage value)? loadNextPage,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaginationReplace value)? replace,
    TResult Function(_PaginationRemove value)? remove,
    TResult Function(_PaginationRefresh value)? refresh,
    TResult Function(_PaginationLoadFirstPage value)? loadFirstPage,
    TResult Function(_PaginationLoadNextPage value)? loadNextPage,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _PaginationRefresh implements PaginationEvent {
  const factory _PaginationRefresh() = _$_PaginationRefresh;
}

/// @nodoc
abstract class _$PaginationLoadFirstPageCopyWith<$Res> {
  factory _$PaginationLoadFirstPageCopyWith(_PaginationLoadFirstPage value,
          $Res Function(_PaginationLoadFirstPage) then) =
      __$PaginationLoadFirstPageCopyWithImpl<$Res>;
  $Res call({int pageSize, Object? filteringKey, Object? config});
}

/// @nodoc
class __$PaginationLoadFirstPageCopyWithImpl<$Res>
    extends _$PaginationEventCopyWithImpl<$Res>
    implements _$PaginationLoadFirstPageCopyWith<$Res> {
  __$PaginationLoadFirstPageCopyWithImpl(_PaginationLoadFirstPage _value,
      $Res Function(_PaginationLoadFirstPage) _then)
      : super(_value, (v) => _then(v as _PaginationLoadFirstPage));

  @override
  _PaginationLoadFirstPage get _value =>
      super._value as _PaginationLoadFirstPage;

  @override
  $Res call({
    Object? pageSize = freezed,
    Object? filteringKey = freezed,
    Object? config = freezed,
  }) {
    return _then(_PaginationLoadFirstPage(
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      filteringKey:
          filteringKey == freezed ? _value.filteringKey : filteringKey,
      config: config == freezed ? _value.config : config,
    ));
  }
}

/// @nodoc

class _$_PaginationLoadFirstPage implements _PaginationLoadFirstPage {
  const _$_PaginationLoadFirstPage(
      {this.pageSize = defaultPageSize, this.filteringKey, this.config});

  @JsonKey(defaultValue: defaultPageSize)
  @override
  final int pageSize;
  @override
  final Object? filteringKey;
  @override
  final Object? config;

  @override
  String toString() {
    return 'PaginationEvent.loadFirstPage(pageSize: $pageSize, filteringKey: $filteringKey, config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationLoadFirstPage &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality()
                .equals(other.filteringKey, filteringKey) &&
            const DeepCollectionEquality().equals(other.config, config));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pageSize,
      const DeepCollectionEquality().hash(filteringKey),
      const DeepCollectionEquality().hash(config));

  @JsonKey(ignore: true)
  @override
  _$PaginationLoadFirstPageCopyWith<_PaginationLoadFirstPage> get copyWith =>
      __$PaginationLoadFirstPageCopyWithImpl<_PaginationLoadFirstPage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, Pageable pageable) replace,
    required TResult Function(int index) remove,
    required TResult Function() refresh,
    required TResult Function(
            int pageSize, Object? filteringKey, Object? config)
        loadFirstPage,
    required TResult Function(int pageSize) loadNextPage,
  }) {
    return loadFirstPage(pageSize, filteringKey, config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int index, Pageable pageable)? replace,
    TResult Function(int index)? remove,
    TResult Function()? refresh,
    TResult Function(int pageSize, Object? filteringKey, Object? config)?
        loadFirstPage,
    TResult Function(int pageSize)? loadNextPage,
  }) {
    return loadFirstPage?.call(pageSize, filteringKey, config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, Pageable pageable)? replace,
    TResult Function(int index)? remove,
    TResult Function()? refresh,
    TResult Function(int pageSize, Object? filteringKey, Object? config)?
        loadFirstPage,
    TResult Function(int pageSize)? loadNextPage,
    required TResult orElse(),
  }) {
    if (loadFirstPage != null) {
      return loadFirstPage(pageSize, filteringKey, config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaginationReplace value) replace,
    required TResult Function(_PaginationRemove value) remove,
    required TResult Function(_PaginationRefresh value) refresh,
    required TResult Function(_PaginationLoadFirstPage value) loadFirstPage,
    required TResult Function(_PaginationLoadNextPage value) loadNextPage,
  }) {
    return loadFirstPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PaginationReplace value)? replace,
    TResult Function(_PaginationRemove value)? remove,
    TResult Function(_PaginationRefresh value)? refresh,
    TResult Function(_PaginationLoadFirstPage value)? loadFirstPage,
    TResult Function(_PaginationLoadNextPage value)? loadNextPage,
  }) {
    return loadFirstPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaginationReplace value)? replace,
    TResult Function(_PaginationRemove value)? remove,
    TResult Function(_PaginationRefresh value)? refresh,
    TResult Function(_PaginationLoadFirstPage value)? loadFirstPage,
    TResult Function(_PaginationLoadNextPage value)? loadNextPage,
    required TResult orElse(),
  }) {
    if (loadFirstPage != null) {
      return loadFirstPage(this);
    }
    return orElse();
  }
}

abstract class _PaginationLoadFirstPage implements PaginationEvent {
  const factory _PaginationLoadFirstPage(
      {int pageSize,
      Object? filteringKey,
      Object? config}) = _$_PaginationLoadFirstPage;

  int get pageSize;
  Object? get filteringKey;
  Object? get config;
  @JsonKey(ignore: true)
  _$PaginationLoadFirstPageCopyWith<_PaginationLoadFirstPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PaginationLoadNextPageCopyWith<$Res> {
  factory _$PaginationLoadNextPageCopyWith(_PaginationLoadNextPage value,
          $Res Function(_PaginationLoadNextPage) then) =
      __$PaginationLoadNextPageCopyWithImpl<$Res>;
  $Res call({int pageSize});
}

/// @nodoc
class __$PaginationLoadNextPageCopyWithImpl<$Res>
    extends _$PaginationEventCopyWithImpl<$Res>
    implements _$PaginationLoadNextPageCopyWith<$Res> {
  __$PaginationLoadNextPageCopyWithImpl(_PaginationLoadNextPage _value,
      $Res Function(_PaginationLoadNextPage) _then)
      : super(_value, (v) => _then(v as _PaginationLoadNextPage));

  @override
  _PaginationLoadNextPage get _value => super._value as _PaginationLoadNextPage;

  @override
  $Res call({
    Object? pageSize = freezed,
  }) {
    return _then(_PaginationLoadNextPage(
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PaginationLoadNextPage implements _PaginationLoadNextPage {
  const _$_PaginationLoadNextPage({this.pageSize = defaultPageSize});

  @JsonKey(defaultValue: defaultPageSize)
  @override
  final int pageSize;

  @override
  String toString() {
    return 'PaginationEvent.loadNextPage(pageSize: $pageSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationLoadNextPage &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageSize);

  @JsonKey(ignore: true)
  @override
  _$PaginationLoadNextPageCopyWith<_PaginationLoadNextPage> get copyWith =>
      __$PaginationLoadNextPageCopyWithImpl<_PaginationLoadNextPage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, Pageable pageable) replace,
    required TResult Function(int index) remove,
    required TResult Function() refresh,
    required TResult Function(
            int pageSize, Object? filteringKey, Object? config)
        loadFirstPage,
    required TResult Function(int pageSize) loadNextPage,
  }) {
    return loadNextPage(pageSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int index, Pageable pageable)? replace,
    TResult Function(int index)? remove,
    TResult Function()? refresh,
    TResult Function(int pageSize, Object? filteringKey, Object? config)?
        loadFirstPage,
    TResult Function(int pageSize)? loadNextPage,
  }) {
    return loadNextPage?.call(pageSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, Pageable pageable)? replace,
    TResult Function(int index)? remove,
    TResult Function()? refresh,
    TResult Function(int pageSize, Object? filteringKey, Object? config)?
        loadFirstPage,
    TResult Function(int pageSize)? loadNextPage,
    required TResult orElse(),
  }) {
    if (loadNextPage != null) {
      return loadNextPage(pageSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaginationReplace value) replace,
    required TResult Function(_PaginationRemove value) remove,
    required TResult Function(_PaginationRefresh value) refresh,
    required TResult Function(_PaginationLoadFirstPage value) loadFirstPage,
    required TResult Function(_PaginationLoadNextPage value) loadNextPage,
  }) {
    return loadNextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PaginationReplace value)? replace,
    TResult Function(_PaginationRemove value)? remove,
    TResult Function(_PaginationRefresh value)? refresh,
    TResult Function(_PaginationLoadFirstPage value)? loadFirstPage,
    TResult Function(_PaginationLoadNextPage value)? loadNextPage,
  }) {
    return loadNextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaginationReplace value)? replace,
    TResult Function(_PaginationRemove value)? remove,
    TResult Function(_PaginationRefresh value)? refresh,
    TResult Function(_PaginationLoadFirstPage value)? loadFirstPage,
    TResult Function(_PaginationLoadNextPage value)? loadNextPage,
    required TResult orElse(),
  }) {
    if (loadNextPage != null) {
      return loadNextPage(this);
    }
    return orElse();
  }
}

abstract class _PaginationLoadNextPage implements PaginationEvent {
  const factory _PaginationLoadNextPage({int pageSize}) =
      _$_PaginationLoadNextPage;

  int get pageSize;
  @JsonKey(ignore: true)
  _$PaginationLoadNextPageCopyWith<_PaginationLoadNextPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$PaginationStateTearOff {
  const _$PaginationStateTearOff();

  PaginationLoadedState<T> call<T extends Pageable>(
      {required bool hasError,
      required bool isLoading,
      required bool isLoadingMore,
      required bool hasReachedMax,
      required int paginationKey,
      required int pageSize,
      required Object? filteringKey,
      required Object? config,
      required List<T> items}) {
    return PaginationLoadedState<T>(
      hasError: hasError,
      isLoading: isLoading,
      isLoadingMore: isLoadingMore,
      hasReachedMax: hasReachedMax,
      paginationKey: paginationKey,
      pageSize: pageSize,
      filteringKey: filteringKey,
      config: config,
      items: items,
    );
  }
}

/// @nodoc
const $PaginationState = _$PaginationStateTearOff();

/// @nodoc
mixin _$PaginationState<T extends Pageable> {
  bool get hasError => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  int get paginationKey => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  Object? get filteringKey => throw _privateConstructorUsedError;
  Object? get config => throw _privateConstructorUsedError;
  List<T> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationStateCopyWith<T, PaginationState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationStateCopyWith<T extends Pageable, $Res> {
  factory $PaginationStateCopyWith(
          PaginationState<T> value, $Res Function(PaginationState<T>) then) =
      _$PaginationStateCopyWithImpl<T, $Res>;
  $Res call(
      {bool hasError,
      bool isLoading,
      bool isLoadingMore,
      bool hasReachedMax,
      int paginationKey,
      int pageSize,
      Object? filteringKey,
      Object? config,
      List<T> items});
}

/// @nodoc
class _$PaginationStateCopyWithImpl<T extends Pageable, $Res>
    implements $PaginationStateCopyWith<T, $Res> {
  _$PaginationStateCopyWithImpl(this._value, this._then);

  final PaginationState<T> _value;
  // ignore: unused_field
  final $Res Function(PaginationState<T>) _then;

  @override
  $Res call({
    Object? hasError = freezed,
    Object? isLoading = freezed,
    Object? isLoadingMore = freezed,
    Object? hasReachedMax = freezed,
    Object? paginationKey = freezed,
    Object? pageSize = freezed,
    Object? filteringKey = freezed,
    Object? config = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: isLoadingMore == freezed
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: hasReachedMax == freezed
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      paginationKey: paginationKey == freezed
          ? _value.paginationKey
          : paginationKey // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      filteringKey:
          filteringKey == freezed ? _value.filteringKey : filteringKey,
      config: config == freezed ? _value.config : config,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
abstract class $PaginationLoadedStateCopyWith<T extends Pageable, $Res>
    implements $PaginationStateCopyWith<T, $Res> {
  factory $PaginationLoadedStateCopyWith(PaginationLoadedState<T> value,
          $Res Function(PaginationLoadedState<T>) then) =
      _$PaginationLoadedStateCopyWithImpl<T, $Res>;
  @override
  $Res call(
      {bool hasError,
      bool isLoading,
      bool isLoadingMore,
      bool hasReachedMax,
      int paginationKey,
      int pageSize,
      Object? filteringKey,
      Object? config,
      List<T> items});
}

/// @nodoc
class _$PaginationLoadedStateCopyWithImpl<T extends Pageable, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res>
    implements $PaginationLoadedStateCopyWith<T, $Res> {
  _$PaginationLoadedStateCopyWithImpl(PaginationLoadedState<T> _value,
      $Res Function(PaginationLoadedState<T>) _then)
      : super(_value, (v) => _then(v as PaginationLoadedState<T>));

  @override
  PaginationLoadedState<T> get _value =>
      super._value as PaginationLoadedState<T>;

  @override
  $Res call({
    Object? hasError = freezed,
    Object? isLoading = freezed,
    Object? isLoadingMore = freezed,
    Object? hasReachedMax = freezed,
    Object? paginationKey = freezed,
    Object? pageSize = freezed,
    Object? filteringKey = freezed,
    Object? config = freezed,
    Object? items = freezed,
  }) {
    return _then(PaginationLoadedState<T>(
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: isLoadingMore == freezed
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: hasReachedMax == freezed
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      paginationKey: paginationKey == freezed
          ? _value.paginationKey
          : paginationKey // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      filteringKey:
          filteringKey == freezed ? _value.filteringKey : filteringKey,
      config: config == freezed ? _value.config : config,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$PaginationLoadedState<T extends Pageable>
    implements PaginationLoadedState<T> {
  const _$PaginationLoadedState(
      {required this.hasError,
      required this.isLoading,
      required this.isLoadingMore,
      required this.hasReachedMax,
      required this.paginationKey,
      required this.pageSize,
      required this.filteringKey,
      required this.config,
      required this.items});

  @override
  final bool hasError;
  @override
  final bool isLoading;
  @override
  final bool isLoadingMore;
  @override
  final bool hasReachedMax;
  @override
  final int paginationKey;
  @override
  final int pageSize;
  @override
  final Object? filteringKey;
  @override
  final Object? config;
  @override
  final List<T> items;

  @override
  String toString() {
    return 'PaginationState<$T>(hasError: $hasError, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasReachedMax: $hasReachedMax, paginationKey: $paginationKey, pageSize: $pageSize, filteringKey: $filteringKey, config: $config, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginationLoadedState<T> &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.paginationKey, paginationKey) ||
                other.paginationKey == paginationKey) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality()
                .equals(other.filteringKey, filteringKey) &&
            const DeepCollectionEquality().equals(other.config, config) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      hasError,
      isLoading,
      isLoadingMore,
      hasReachedMax,
      paginationKey,
      pageSize,
      const DeepCollectionEquality().hash(filteringKey),
      const DeepCollectionEquality().hash(config),
      const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  $PaginationLoadedStateCopyWith<T, PaginationLoadedState<T>> get copyWith =>
      _$PaginationLoadedStateCopyWithImpl<T, PaginationLoadedState<T>>(
          this, _$identity);
}

abstract class PaginationLoadedState<T extends Pageable>
    implements PaginationState<T> {
  const factory PaginationLoadedState(
      {required bool hasError,
      required bool isLoading,
      required bool isLoadingMore,
      required bool hasReachedMax,
      required int paginationKey,
      required int pageSize,
      required Object? filteringKey,
      required Object? config,
      required List<T> items}) = _$PaginationLoadedState<T>;

  @override
  bool get hasError;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  bool get hasReachedMax;
  @override
  int get paginationKey;
  @override
  int get pageSize;
  @override
  Object? get filteringKey;
  @override
  Object? get config;
  @override
  List<T> get items;
  @override
  @JsonKey(ignore: true)
  $PaginationLoadedStateCopyWith<T, PaginationLoadedState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
