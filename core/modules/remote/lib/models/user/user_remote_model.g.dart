// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRemoteModel _$UserRemoteModelFromJson(Map<String, dynamic> json) =>
    UserRemoteModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserRemoteModelToJson(UserRemoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
