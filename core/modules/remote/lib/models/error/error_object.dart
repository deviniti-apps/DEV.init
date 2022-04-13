import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_object.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class ErrorObject {
  const ErrorObject({
    this.timestamp,
    this.error,
    this.message,
    this.traceId,
  });

  @JsonKey(name: 'timestamp')
  final DateTime? timestamp;
  @JsonKey(name: 'error')
  final String? error;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'traceId')
  final String? traceId;

  factory ErrorObject.fromJson(Map<String, dynamic> json) => _$ErrorObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorObjectToJson(this);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ErrorObject &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality().equals(other.timestamp, timestamp)) &&
            (identical(other.error, error) || const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.message, message) || const DeepCollectionEquality().equals(other.message, message)) &&
            (identical(other.traceId, traceId) || const DeepCollectionEquality().equals(other.traceId, traceId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(traceId) ^
      runtimeType.hashCode;
}
