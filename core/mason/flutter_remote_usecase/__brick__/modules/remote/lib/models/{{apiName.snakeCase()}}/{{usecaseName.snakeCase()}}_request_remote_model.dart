import 'package:freezed_annotation/freezed_annotation.dart';

part '{{usecaseName.snakeCase()}}_request_remote_model.freezed.dart';
part '{{usecaseName.snakeCase()}}_request_remote_model.g.dart';

@freezed
abstract class {{usecaseName.pascalCase()}}RequestRemoteModel with _${{usecaseName.pascalCase()}}RequestRemoteModel {
  const factory {{usecaseName.pascalCase()}}RequestRemoteModel({
    // put request remote model fields here
  }) = _{{usecaseName.pascalCase()}}RequestRemoteModel;

  factory {{usecaseName.pascalCase()}}RequestRemoteModel.fromJson(Map<String, dynamic> json) =>
      _${{usecaseName.pascalCase()}}RequestRemoteModelFromJson(json);
}
