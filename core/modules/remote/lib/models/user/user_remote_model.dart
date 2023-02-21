import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_remote_model.freezed.dart';
part 'user_remote_model.g.dart';

@freezed
class UserRemoteModel with _$UserRemoteModel {
  const factory UserRemoteModel({
    required int id,
    required String name,
    required String email,
  }) = _UserRemoteModel;

  factory UserRemoteModel.fromJson(Map<String, dynamic> json) => _$UserRemoteModelFromJson(json);
}
