// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'snack_bar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SnackBarEventTearOff {
  const _$SnackBarEventTearOff();

  _SnackBarShowMessageRequested showMessageRequested(
      {required SnackBarMessage snackBarMessage}) {
    return _SnackBarShowMessageRequested(
      snackBarMessage: snackBarMessage,
    );
  }
}

/// @nodoc
const $SnackBarEvent = _$SnackBarEventTearOff();

/// @nodoc
mixin _$SnackBarEvent {
  SnackBarMessage get snackBarMessage => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SnackBarMessage snackBarMessage)
        showMessageRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SnackBarMessage snackBarMessage)? showMessageRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SnackBarMessage snackBarMessage)? showMessageRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnackBarShowMessageRequested value)
        showMessageRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnackBarShowMessageRequested value)? showMessageRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnackBarShowMessageRequested value)? showMessageRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SnackBarEventCopyWith<SnackBarEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnackBarEventCopyWith<$Res> {
  factory $SnackBarEventCopyWith(
          SnackBarEvent value, $Res Function(SnackBarEvent) then) =
      _$SnackBarEventCopyWithImpl<$Res>;
  $Res call({SnackBarMessage snackBarMessage});
}

/// @nodoc
class _$SnackBarEventCopyWithImpl<$Res>
    implements $SnackBarEventCopyWith<$Res> {
  _$SnackBarEventCopyWithImpl(this._value, this._then);

  final SnackBarEvent _value;
  // ignore: unused_field
  final $Res Function(SnackBarEvent) _then;

  @override
  $Res call({
    Object? snackBarMessage = freezed,
  }) {
    return _then(_value.copyWith(
      snackBarMessage: snackBarMessage == freezed
          ? _value.snackBarMessage
          : snackBarMessage // ignore: cast_nullable_to_non_nullable
              as SnackBarMessage,
    ));
  }
}

/// @nodoc
abstract class _$SnackBarShowMessageRequestedCopyWith<$Res>
    implements $SnackBarEventCopyWith<$Res> {
  factory _$SnackBarShowMessageRequestedCopyWith(
          _SnackBarShowMessageRequested value,
          $Res Function(_SnackBarShowMessageRequested) then) =
      __$SnackBarShowMessageRequestedCopyWithImpl<$Res>;
  @override
  $Res call({SnackBarMessage snackBarMessage});
}

/// @nodoc
class __$SnackBarShowMessageRequestedCopyWithImpl<$Res>
    extends _$SnackBarEventCopyWithImpl<$Res>
    implements _$SnackBarShowMessageRequestedCopyWith<$Res> {
  __$SnackBarShowMessageRequestedCopyWithImpl(
      _SnackBarShowMessageRequested _value,
      $Res Function(_SnackBarShowMessageRequested) _then)
      : super(_value, (v) => _then(v as _SnackBarShowMessageRequested));

  @override
  _SnackBarShowMessageRequested get _value =>
      super._value as _SnackBarShowMessageRequested;

  @override
  $Res call({
    Object? snackBarMessage = freezed,
  }) {
    return _then(_SnackBarShowMessageRequested(
      snackBarMessage: snackBarMessage == freezed
          ? _value.snackBarMessage
          : snackBarMessage // ignore: cast_nullable_to_non_nullable
              as SnackBarMessage,
    ));
  }
}

/// @nodoc

class _$_SnackBarShowMessageRequested implements _SnackBarShowMessageRequested {
  const _$_SnackBarShowMessageRequested({required this.snackBarMessage});

  @override
  final SnackBarMessage snackBarMessage;

  @override
  String toString() {
    return 'SnackBarEvent.showMessageRequested(snackBarMessage: $snackBarMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SnackBarShowMessageRequested &&
            (identical(other.snackBarMessage, snackBarMessage) ||
                other.snackBarMessage == snackBarMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, snackBarMessage);

  @JsonKey(ignore: true)
  @override
  _$SnackBarShowMessageRequestedCopyWith<_SnackBarShowMessageRequested>
      get copyWith => __$SnackBarShowMessageRequestedCopyWithImpl<
          _SnackBarShowMessageRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SnackBarMessage snackBarMessage)
        showMessageRequested,
  }) {
    return showMessageRequested(snackBarMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SnackBarMessage snackBarMessage)? showMessageRequested,
  }) {
    return showMessageRequested?.call(snackBarMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SnackBarMessage snackBarMessage)? showMessageRequested,
    required TResult orElse(),
  }) {
    if (showMessageRequested != null) {
      return showMessageRequested(snackBarMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnackBarShowMessageRequested value)
        showMessageRequested,
  }) {
    return showMessageRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnackBarShowMessageRequested value)? showMessageRequested,
  }) {
    return showMessageRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnackBarShowMessageRequested value)? showMessageRequested,
    required TResult orElse(),
  }) {
    if (showMessageRequested != null) {
      return showMessageRequested(this);
    }
    return orElse();
  }
}

abstract class _SnackBarShowMessageRequested implements SnackBarEvent {
  const factory _SnackBarShowMessageRequested(
          {required SnackBarMessage snackBarMessage}) =
      _$_SnackBarShowMessageRequested;

  @override
  SnackBarMessage get snackBarMessage;
  @override
  @JsonKey(ignore: true)
  _$SnackBarShowMessageRequestedCopyWith<_SnackBarShowMessageRequested>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$SnackBarStateTearOff {
  const _$SnackBarStateTearOff();

  _SnackBarInitial initial() {
    return const _SnackBarInitial();
  }

  _SnackBarShowMessage showMessage({required SnackBarMessage snackBarMessage}) {
    return _SnackBarShowMessage(
      snackBarMessage: snackBarMessage,
    );
  }
}

/// @nodoc
const $SnackBarState = _$SnackBarStateTearOff();

/// @nodoc
mixin _$SnackBarState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SnackBarMessage snackBarMessage) showMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SnackBarMessage snackBarMessage)? showMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SnackBarMessage snackBarMessage)? showMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnackBarInitial value) initial,
    required TResult Function(_SnackBarShowMessage value) showMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnackBarInitial value)? initial,
    TResult Function(_SnackBarShowMessage value)? showMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnackBarInitial value)? initial,
    TResult Function(_SnackBarShowMessage value)? showMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnackBarStateCopyWith<$Res> {
  factory $SnackBarStateCopyWith(
          SnackBarState value, $Res Function(SnackBarState) then) =
      _$SnackBarStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SnackBarStateCopyWithImpl<$Res>
    implements $SnackBarStateCopyWith<$Res> {
  _$SnackBarStateCopyWithImpl(this._value, this._then);

  final SnackBarState _value;
  // ignore: unused_field
  final $Res Function(SnackBarState) _then;
}

/// @nodoc
abstract class _$SnackBarInitialCopyWith<$Res> {
  factory _$SnackBarInitialCopyWith(
          _SnackBarInitial value, $Res Function(_SnackBarInitial) then) =
      __$SnackBarInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$SnackBarInitialCopyWithImpl<$Res>
    extends _$SnackBarStateCopyWithImpl<$Res>
    implements _$SnackBarInitialCopyWith<$Res> {
  __$SnackBarInitialCopyWithImpl(
      _SnackBarInitial _value, $Res Function(_SnackBarInitial) _then)
      : super(_value, (v) => _then(v as _SnackBarInitial));

  @override
  _SnackBarInitial get _value => super._value as _SnackBarInitial;
}

/// @nodoc

class _$_SnackBarInitial implements _SnackBarInitial {
  const _$_SnackBarInitial();

  @override
  String toString() {
    return 'SnackBarState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SnackBarInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SnackBarMessage snackBarMessage) showMessage,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SnackBarMessage snackBarMessage)? showMessage,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SnackBarMessage snackBarMessage)? showMessage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnackBarInitial value) initial,
    required TResult Function(_SnackBarShowMessage value) showMessage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnackBarInitial value)? initial,
    TResult Function(_SnackBarShowMessage value)? showMessage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnackBarInitial value)? initial,
    TResult Function(_SnackBarShowMessage value)? showMessage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SnackBarInitial implements SnackBarState {
  const factory _SnackBarInitial() = _$_SnackBarInitial;
}

/// @nodoc
abstract class _$SnackBarShowMessageCopyWith<$Res> {
  factory _$SnackBarShowMessageCopyWith(_SnackBarShowMessage value,
          $Res Function(_SnackBarShowMessage) then) =
      __$SnackBarShowMessageCopyWithImpl<$Res>;
  $Res call({SnackBarMessage snackBarMessage});
}

/// @nodoc
class __$SnackBarShowMessageCopyWithImpl<$Res>
    extends _$SnackBarStateCopyWithImpl<$Res>
    implements _$SnackBarShowMessageCopyWith<$Res> {
  __$SnackBarShowMessageCopyWithImpl(
      _SnackBarShowMessage _value, $Res Function(_SnackBarShowMessage) _then)
      : super(_value, (v) => _then(v as _SnackBarShowMessage));

  @override
  _SnackBarShowMessage get _value => super._value as _SnackBarShowMessage;

  @override
  $Res call({
    Object? snackBarMessage = freezed,
  }) {
    return _then(_SnackBarShowMessage(
      snackBarMessage: snackBarMessage == freezed
          ? _value.snackBarMessage
          : snackBarMessage // ignore: cast_nullable_to_non_nullable
              as SnackBarMessage,
    ));
  }
}

/// @nodoc

class _$_SnackBarShowMessage implements _SnackBarShowMessage {
  const _$_SnackBarShowMessage({required this.snackBarMessage});

  @override
  final SnackBarMessage snackBarMessage;

  @override
  String toString() {
    return 'SnackBarState.showMessage(snackBarMessage: $snackBarMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SnackBarShowMessage &&
            (identical(other.snackBarMessage, snackBarMessage) ||
                other.snackBarMessage == snackBarMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, snackBarMessage);

  @JsonKey(ignore: true)
  @override
  _$SnackBarShowMessageCopyWith<_SnackBarShowMessage> get copyWith =>
      __$SnackBarShowMessageCopyWithImpl<_SnackBarShowMessage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SnackBarMessage snackBarMessage) showMessage,
  }) {
    return showMessage(snackBarMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SnackBarMessage snackBarMessage)? showMessage,
  }) {
    return showMessage?.call(snackBarMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SnackBarMessage snackBarMessage)? showMessage,
    required TResult orElse(),
  }) {
    if (showMessage != null) {
      return showMessage(snackBarMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnackBarInitial value) initial,
    required TResult Function(_SnackBarShowMessage value) showMessage,
  }) {
    return showMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnackBarInitial value)? initial,
    TResult Function(_SnackBarShowMessage value)? showMessage,
  }) {
    return showMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnackBarInitial value)? initial,
    TResult Function(_SnackBarShowMessage value)? showMessage,
    required TResult orElse(),
  }) {
    if (showMessage != null) {
      return showMessage(this);
    }
    return orElse();
  }
}

abstract class _SnackBarShowMessage implements SnackBarState {
  const factory _SnackBarShowMessage(
      {required SnackBarMessage snackBarMessage}) = _$_SnackBarShowMessage;

  SnackBarMessage get snackBarMessage;
  @JsonKey(ignore: true)
  _$SnackBarShowMessageCopyWith<_SnackBarShowMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
