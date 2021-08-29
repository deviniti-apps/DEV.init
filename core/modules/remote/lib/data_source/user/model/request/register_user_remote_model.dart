import 'package:json_annotation/json_annotation.dart';

part 'register_user_remote_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterUserRemoteModel {
  const RegisterUserRemoteModel({this.uid, this.token});

  factory RegisterUserRemoteModel.fromJson(Map<String, dynamic> json) => _$RegisterUserRemoteModelFromJson(json);

  final String? uid;
  final String? token;

  Map<String, dynamic> toJson() => _$RegisterUserRemoteModelToJson(this);
}
