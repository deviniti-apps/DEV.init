import 'package:json_annotation/json_annotation.dart';

part 'user_remote_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserRemoteModel {
  const UserRemoteModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserRemoteModel.fromJson(Map<String, dynamic> json) => _$UserRemoteModelFromJson(json);

  final int id;
  final String name;
  final String email;

  Map<String, dynamic> toJson() => _$UserRemoteModelToJson(this);
}
