// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorObject _$ErrorObjectFromJson(Map<String, dynamic> json) => ErrorObject(
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      error: json['error'] as String?,
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
    );

Map<String, dynamic> _$ErrorObjectToJson(ErrorObject instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp?.toIso8601String(),
      'error': instance.error,
      'message': instance.message,
      'traceId': instance.traceId,
    };
