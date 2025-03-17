import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_object.freezed.dart';
part 'error_object.g.dart';

@freezed
abstract class ErrorObject with _$ErrorObject {
  const factory ErrorObject({
    DateTime? timestamp,
    String? error,
    String? message,
    String? traceId,
  }) = _ErrorObject;

  factory ErrorObject.fromJson(Map<String, dynamic> json) => _$ErrorObjectFromJson(json);
}
