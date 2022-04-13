// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthEventTearOff {
  const _$AuthEventTearOff();

  AuthEventInitiated started() {
    return const AuthEventInitiated();
  }

  AuthEventAuthenticated authenticated() {
    return const AuthEventAuthenticated();
  }

  AuthEventUnAuthenticated unauthenticated() {
    return const AuthEventUnAuthenticated();
  }
}

/// @nodoc
const $AuthEvent = _$AuthEventTearOff();

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitiated value) started,
    required TResult Function(AuthEventAuthenticated value) authenticated,
    required TResult Function(AuthEventUnAuthenticated value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEventInitiated value)? started,
    TResult Function(AuthEventAuthenticated value)? authenticated,
    TResult Function(AuthEventUnAuthenticated value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitiated value)? started,
    TResult Function(AuthEventAuthenticated value)? authenticated,
    TResult Function(AuthEventUnAuthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class $AuthEventInitiatedCopyWith<$Res> {
  factory $AuthEventInitiatedCopyWith(
          AuthEventInitiated value, $Res Function(AuthEventInitiated) then) =
      _$AuthEventInitiatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventInitiatedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthEventInitiatedCopyWith<$Res> {
  _$AuthEventInitiatedCopyWithImpl(
      AuthEventInitiated _value, $Res Function(AuthEventInitiated) _then)
      : super(_value, (v) => _then(v as AuthEventInitiated));

  @override
  AuthEventInitiated get _value => super._value as AuthEventInitiated;
}

/// @nodoc

class _$AuthEventInitiated implements AuthEventInitiated {
  const _$AuthEventInitiated();

  @override
  String toString() {
    return 'AuthEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEventInitiated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitiated value) started,
    required TResult Function(AuthEventAuthenticated value) authenticated,
    required TResult Function(AuthEventUnAuthenticated value) unauthenticated,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEventInitiated value)? started,
    TResult Function(AuthEventAuthenticated value)? authenticated,
    TResult Function(AuthEventUnAuthenticated value)? unauthenticated,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitiated value)? started,
    TResult Function(AuthEventAuthenticated value)? authenticated,
    TResult Function(AuthEventUnAuthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class AuthEventInitiated implements AuthEvent {
  const factory AuthEventInitiated() = _$AuthEventInitiated;
}

/// @nodoc
abstract class $AuthEventAuthenticatedCopyWith<$Res> {
  factory $AuthEventAuthenticatedCopyWith(AuthEventAuthenticated value,
          $Res Function(AuthEventAuthenticated) then) =
      _$AuthEventAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventAuthenticatedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthEventAuthenticatedCopyWith<$Res> {
  _$AuthEventAuthenticatedCopyWithImpl(AuthEventAuthenticated _value,
      $Res Function(AuthEventAuthenticated) _then)
      : super(_value, (v) => _then(v as AuthEventAuthenticated));

  @override
  AuthEventAuthenticated get _value => super._value as AuthEventAuthenticated;
}

/// @nodoc

class _$AuthEventAuthenticated implements AuthEventAuthenticated {
  const _$AuthEventAuthenticated();

  @override
  String toString() {
    return 'AuthEvent.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEventAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitiated value) started,
    required TResult Function(AuthEventAuthenticated value) authenticated,
    required TResult Function(AuthEventUnAuthenticated value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEventInitiated value)? started,
    TResult Function(AuthEventAuthenticated value)? authenticated,
    TResult Function(AuthEventUnAuthenticated value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitiated value)? started,
    TResult Function(AuthEventAuthenticated value)? authenticated,
    TResult Function(AuthEventUnAuthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthEventAuthenticated implements AuthEvent {
  const factory AuthEventAuthenticated() = _$AuthEventAuthenticated;
}

/// @nodoc
abstract class $AuthEventUnAuthenticatedCopyWith<$Res> {
  factory $AuthEventUnAuthenticatedCopyWith(AuthEventUnAuthenticated value,
          $Res Function(AuthEventUnAuthenticated) then) =
      _$AuthEventUnAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventUnAuthenticatedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthEventUnAuthenticatedCopyWith<$Res> {
  _$AuthEventUnAuthenticatedCopyWithImpl(AuthEventUnAuthenticated _value,
      $Res Function(AuthEventUnAuthenticated) _then)
      : super(_value, (v) => _then(v as AuthEventUnAuthenticated));

  @override
  AuthEventUnAuthenticated get _value =>
      super._value as AuthEventUnAuthenticated;
}

/// @nodoc

class _$AuthEventUnAuthenticated implements AuthEventUnAuthenticated {
  const _$AuthEventUnAuthenticated();

  @override
  String toString() {
    return 'AuthEvent.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEventUnAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitiated value) started,
    required TResult Function(AuthEventAuthenticated value) authenticated,
    required TResult Function(AuthEventUnAuthenticated value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEventInitiated value)? started,
    TResult Function(AuthEventAuthenticated value)? authenticated,
    TResult Function(AuthEventUnAuthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitiated value)? started,
    TResult Function(AuthEventAuthenticated value)? authenticated,
    TResult Function(AuthEventUnAuthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthEventUnAuthenticated implements AuthEvent {
  const factory AuthEventUnAuthenticated() = _$AuthEventUnAuthenticated;
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthState call({required bool isAuthenticated}) {
    return _AuthState(
      isAuthenticated: isAuthenticated,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  bool get isAuthenticated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call({bool isAuthenticated});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? isAuthenticated = freezed,
  }) {
    return _then(_value.copyWith(
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isAuthenticated});
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object? isAuthenticated = freezed,
  }) {
    return _then(_AuthState(
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState({required this.isAuthenticated});

  @override
  final bool isAuthenticated;

  @override
  String toString() {
    return 'AuthState(isAuthenticated: $isAuthenticated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthState &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAuthenticated);

  @JsonKey(ignore: true)
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState({required bool isAuthenticated}) = _$_AuthState;

  @override
  bool get isAuthenticated;
  @override
  @JsonKey(ignore: true)
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
