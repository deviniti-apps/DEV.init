import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_detail.freezed.dart';

@freezed
class ErrorDetail with _$ErrorDetail {
  const factory ErrorDetail({
    @Default(null) String? errorCode,
    @Default(null) String? message,
    @Default(null) String? traceId,
    @Default(null) DateTime? timestamp,
    @Default(null) Object? throwable,
    @Default(null) StackTrace? stackTrace,
  }) = _ErrorDetail;

  factory ErrorDetail.fatal({Object? throwable, StackTrace? stackTrace}) {
    return ErrorDetail(errorCode: 'fatal', throwable: throwable, stackTrace: stackTrace);
  }
}
