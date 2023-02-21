// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ErrorObject _$$_ErrorObjectFromJson(Map<String, dynamic> json) =>
    _$_ErrorObject(
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      error: json['error'] as String?,
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
    );

Map<String, dynamic> _$$_ErrorObjectToJson(_$_ErrorObject instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp?.toIso8601String(),
      'error': instance.error,
      'message': instance.message,
      'traceId': instance.traceId,
    };
