{{#returnsDomainModel}}import 'package:domain/model/{{domainModelName.snakeCase()}}.dart';
{{/returnsDomainModel}}{{#acceptsParam}}import 'package:domain/model/{{usecaseName.snakeCase()}}_request.dart';
{{/acceptsParam}}import 'package:domain/model/error_detail.dart';
import 'package:fpdart/fpdart.dart';

abstract class {{usecaseName.pascalCase()}}RemoteSourceAction {
  TaskEither<ErrorDetail, {{#returnsDomainModel}}{{domainModelName.pascalCase()}}{{/returnsDomainModel}}{{^returnsDomainModel}}Unit{{/returnsDomainModel}}> execute({{#acceptsParam}}{{usecaseName.pascalCase()}}Request request{{/acceptsParam}});
}
