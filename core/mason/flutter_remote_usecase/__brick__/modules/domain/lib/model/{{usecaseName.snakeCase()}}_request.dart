import 'package:freezed_annotation/freezed_annotation.dart';

part '{{usecaseName.snakeCase()}}_request.freezed.dart';

@freezed
class {{usecaseName.pascalCase()}}Request with _${{usecaseName.pascalCase()}}Request {
  const factory {{usecaseName.pascalCase()}}Request({
    // put your request fields here
  }) = _{{usecaseName.pascalCase()}}Request;
}
