import 'package:freezed_annotation/freezed_annotation.dart';

part '{{domainModelName.snakeCase()}}.freezed.dart';
part '{{domainModelName.snakeCase()}}.g.dart';

@freezed
class {{domainModelName.pascalCase()}} with _${{domainModelName.pascalCase()}} {
  const factory {{domainModelName.pascalCase()}}({
    // put your domain model fields here
  }) = _{{domainModelName.pascalCase()}};

  factory {{domainModelName.pascalCase()}}.fromJson(Map<String, dynamic> json) => _${{domainModelName.pascalCase()}}FromJson(json);
}
