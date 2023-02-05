import 'package:domain/data_source_action/{{usecaseName.snakeCase()}}_remote_source_action.dart';{{#returnsDomainModel}}
import 'package:domain/model/{{domainModelName.snakeCase()}}.dart';{{/returnsDomainModel}}{{#acceptsParam}}
import 'package:domain/model/{{usecaseName.snakeCase()}}_request.dart';{{/acceptsParam}}
import 'package:domain/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

enum {{usecaseName.pascalCase()}}Failure { fatal }

class {{usecaseName.pascalCase()}}Usecase implements {{#acceptsParam}}Param{{/acceptsParam}}UseCase<{{usecaseName.pascalCase()}}Failure, {{#returnsDomainModel}}{{domainModelName.pascalCase()}}{{/returnsDomainModel}}{{^returnsDomainModel}}Unit{{/returnsDomainModel}}{{#acceptsParam}}, {{usecaseName.pascalCase()}}Request{{/acceptsParam}}> {
  const {{usecaseName.pascalCase()}}Usecase({
    required {{usecaseName.pascalCase()}}RemoteSourceAction {{usecaseName.camelCase()}}RemoteSourceAction,
  }) : _{{usecaseName.camelCase()}}RemoteSourceAction = {{usecaseName.camelCase()}}RemoteSourceAction;

  final {{usecaseName.pascalCase()}}RemoteSourceAction _{{usecaseName.camelCase()}}RemoteSourceAction;

  @override
  TaskEither<{{usecaseName.pascalCase()}}Failure, {{#returnsDomainModel}}{{domainModelName.pascalCase()}}{{/returnsDomainModel}}{{^returnsDomainModel}}Unit{{/returnsDomainModel}}> execute({{#acceptsParam}}{required {{usecaseName.pascalCase()}}Request param}{{/acceptsParam}}) {
    return _{{usecaseName.camelCase()}}RemoteSourceAction.execute({{#acceptsParam}}param{{/acceptsParam}}).bimap(
          (errorDetail) => errorDetail.map(
            backend: (backendError) {
              switch (backendError.errorCode) {
                default:
                  return {{usecaseName.pascalCase()}}Failure.fatal;
              }
            },
            fatal: (fatalError) => {{usecaseName.pascalCase()}}Failure.fatal,
          ),
          (r) => r,
        );
  }
}
