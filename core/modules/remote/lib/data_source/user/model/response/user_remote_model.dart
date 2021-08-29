import 'package:domain/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_remote_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserRemoteModel {
  const UserRemoteModel({this.id, this.name});

  factory UserRemoteModel.fromJson(Map<String, dynamic> json) => _$UserRemoteModelFromJson(json);

  final int? id;
  final String? name;

  Map<String, dynamic> toJson() => _$UserRemoteModelToJson(this);
}

extension UserRemoteModelMapper on UserRemoteModel {
  User toUser() {
    return User(
      id: id,
      name: name,
    );
  }
}
