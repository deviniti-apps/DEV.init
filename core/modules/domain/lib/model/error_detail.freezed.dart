// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'error_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ErrorDetailTearOff {
  const _$ErrorDetailTearOff();

  _ErrorDetail call(
      {String? errorCode = null,
      String? message = null,
      String? traceId = null,
      DateTime? timestamp = null,
      Object? throwable = null,
      StackTrace? stackTrace = null}) {
    return _ErrorDetail(
      errorCode: errorCode,
      message: message,
      traceId: traceId,
      timestamp: timestamp,
      throwable: throwable,
      stackTrace: stackTrace,
    );
  }
}

/// @nodoc
const $ErrorDetail = _$ErrorDetailTearOff();

/// @nodoc
mixin _$ErrorDetail {
  String? get errorCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get traceId => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;
  Object? get throwable => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ErrorDetailCopyWith<ErrorDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorDetailCopyWith<$Res> {
  factory $ErrorDetailCopyWith(
          ErrorDetail value, $Res Function(ErrorDetail) then) =
      _$ErrorDetailCopyWithImpl<$Res>;
  $Res call(
      {String? errorCode,
      String? message,
      String? traceId,
      DateTime? timestamp,
      Object? throwable,
      StackTrace? stackTrace});
}

/// @nodoc
class _$ErrorDetailCopyWithImpl<$Res> implements $ErrorDetailCopyWith<$Res> {
  _$ErrorDetailCopyWithImpl(this._value, this._then);

  final ErrorDetail _value;
  // ignore: unused_field
  final $Res Function(ErrorDetail) _then;

  @override
  $Res call({
    Object? errorCode = freezed,
    Object? message = freezed,
    Object? traceId = freezed,
    Object? timestamp = freezed,
    Object? throwable = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      traceId: traceId == freezed
          ? _value.traceId
          : traceId // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      throwable: throwable == freezed ? _value.throwable : throwable,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc
abstract class _$ErrorDetailCopyWith<$Res>
    implements $ErrorDetailCopyWith<$Res> {
  factory _$ErrorDetailCopyWith(
          _ErrorDetail value, $Res Function(_ErrorDetail) then) =
      __$ErrorDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? errorCode,
      String? message,
      String? traceId,
      DateTime? timestamp,
      Object? throwable,
      StackTrace? stackTrace});
}

/// @nodoc
class __$ErrorDetailCopyWithImpl<$Res> extends _$ErrorDetailCopyWithImpl<$Res>
    implements _$ErrorDetailCopyWith<$Res> {
  __$ErrorDetailCopyWithImpl(
      _ErrorDetail _value, $Res Function(_ErrorDetail) _then)
      : super(_value, (v) => _then(v as _ErrorDetail));

  @override
  _ErrorDetail get _value => super._value as _ErrorDetail;

  @override
  $Res call({
    Object? errorCode = freezed,
    Object? message = freezed,
    Object? traceId = freezed,
    Object? timestamp = freezed,
    Object? throwable = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_ErrorDetail(
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      traceId: traceId == freezed
          ? _value.traceId
          : traceId // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      throwable: throwable == freezed ? _value.throwable : throwable,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$_ErrorDetail implements _ErrorDetail {
  const _$_ErrorDetail(
      {this.errorCode = null,
      this.message = null,
      this.traceId = null,
      this.timestamp = null,
      this.throwable = null,
      this.stackTrace = null});

  @JsonKey(defaultValue: null)
  @override
  final String? errorCode;
  @JsonKey(defaultValue: null)
  @override
  final String? message;
  @JsonKey(defaultValue: null)
  @override
  final String? traceId;
  @JsonKey(defaultValue: null)
  @override
  final DateTime? timestamp;
  @JsonKey(defaultValue: null)
  @override
  final Object? throwable;
  @JsonKey(defaultValue: null)
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'ErrorDetail(errorCode: $errorCode, message: $message, traceId: $traceId, timestamp: $timestamp, throwable: $throwable, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ErrorDetail &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.traceId, traceId) || other.traceId == traceId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.throwable, throwable) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorCode, message, traceId,
      timestamp, const DeepCollectionEquality().hash(throwable), stackTrace);

  @JsonKey(ignore: true)
  @override
  _$ErrorDetailCopyWith<_ErrorDetail> get copyWith =>
      __$ErrorDetailCopyWithImpl<_ErrorDetail>(this, _$identity);
}

abstract class _ErrorDetail implements ErrorDetail {
  const factory _ErrorDetail(
      {String? errorCode,
      String? message,
      String? traceId,
      DateTime? timestamp,
      Object? throwable,
      StackTrace? stackTrace}) = _$_ErrorDetail;

  @override
  String? get errorCode;
  @override
  String? get message;
  @override
  String? get traceId;
  @override
  DateTime? get timestamp;
  @override
  Object? get throwable;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$ErrorDetailCopyWith<_ErrorDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
