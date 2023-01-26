import 'package:freezed_annotation/freezed_annotation.dart';

part '{{usecaseName.snakeCase()}}_response_remote_model.freezed.dart';
part '{{usecaseName.snakeCase()}}_response_remote_model.g.dart';

@freezed
class {{usecaseName.pascalCase()}}ResponseRemoteModel with _${{usecaseName.pascalCase()}}ResponseRemoteModel {
  const factory {{usecaseName.pascalCase()}}ResponseRemoteModel({
    // put response remote model fields here
  }) = _{{usecaseName.pascalCase()}}ResponseRemoteModel;

  factory {{usecaseName.pascalCase()}}ResponseRemoteModel.fromJson(Map<String, dynamic> json) =>
      _${{usecaseName.pascalCase()}}ResponseRemoteModelFromJson(json);
}
