import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_detail.freezed.dart';

@freezed
abstract class ErrorDetail with _$ErrorDetail {
  const factory ErrorDetail.backend({
    String? errorCode,
    String? message,
    String? traceId,
    DateTime? timestamp,
    Object? throwable,
    StackTrace? stackTrace,
  }) = ErrorDetailBackend;

  const factory ErrorDetail.fatal({
    Object? throwable,
    StackTrace? stackTrace,
  }) = ErrorDetailFatal;
}
