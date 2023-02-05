import 'package:domain/data_source_action/{{usecaseName.snakeCase()}}_remote_source_action.dart';{{#returnsDomainModel}}
import 'package:domain/model/{{domainModelName.snakeCase()}}.dart';{{/returnsDomainModel}}{{#acceptsParam}}
import 'package:domain/model/{{usecaseName.snakeCase()}}_request.dart';{{/acceptsParam}}
import 'package:domain/model/error_detail.dart';
import 'package:foundation/fpdarts.dart';
import 'package:fpdart/fpdart.dart';
import 'package:remote/api/{{apiName.snakeCase()}}_rest_api.dart';
import 'package:remote/mapper/mapper.dart';{{#acceptsParam}}
import 'package:remote/models/{{apiName.snakeCase()}}/{{usecaseName.snakeCase()}}_request_remote_model.dart';{{/acceptsParam}}{{#returnsDomainModel}}
import 'package:remote/models/{{apiName.snakeCase()}}/{{usecaseName.snakeCase()}}_response_remote_model.dart';{{/returnsDomainModel}}
import 'package:remote/other/error/error_converter.dart';

class {{usecaseName.pascalCase()}}RemoteSourceActionImpl implements {{usecaseName.pascalCase()}}RemoteSourceAction {
  const {{usecaseName.pascalCase()}}RemoteSourceActionImpl({
    required {{apiName.pascalCase()}}RestApi {{apiName.camelCase()}}RestApi,
    required ErrorConverter errorConverter{{#acceptsParam}},
    required Mapper<{{usecaseName.pascalCase()}}Request, {{usecaseName.pascalCase()}}RequestRemoteModel> {{usecaseName.camelCase()}}RequestToRemoteMapper{{/acceptsParam}}{{#returnsDomainModel}},
    required Mapper<{{usecaseName.pascalCase()}}ResponseRemoteModel, {{domainModelName.pascalCase()}}> {{usecaseName.camelCase()}}ResponseToDomainMapper{{/returnsDomainModel}},
  })  : _{{apiName.camelCase()}}RestApi = {{apiName.camelCase()}}RestApi,
        _errorConverter = errorConverter{{#acceptsParam}},
        _{{usecaseName.camelCase()}}RequestToRemoteMapper = {{usecaseName.camelCase()}}RequestToRemoteMapper{{/acceptsParam}}{{#returnsDomainModel}},
        _{{usecaseName.camelCase()}}ResponseToDomainMapper = {{usecaseName.camelCase()}}ResponseToDomainMapper{{/returnsDomainModel}};

  final {{apiName.pascalCase()}}RestApi _{{apiName.camelCase()}}RestApi;
  final ErrorConverter _errorConverter;{{#acceptsParam}}
  final Mapper<{{usecaseName.pascalCase()}}Request, {{usecaseName.pascalCase()}}RequestRemoteModel> _{{usecaseName.camelCase()}}RequestToRemoteMapper;{{/acceptsParam}}{{#returnsDomainModel}}
  final Mapper<{{usecaseName.pascalCase()}}ResponseRemoteModel, {{domainModelName.pascalCase()}}> _{{usecaseName.camelCase()}}ResponseToDomainMapper;{{/returnsDomainModel}}

  @override
  TaskEither<ErrorDetail, {{#returnsDomainModel}}{{domainModelName.pascalCase()}}{{/returnsDomainModel}}{{^returnsDomainModel}}Unit{{/returnsDomainModel}}> execute({{#acceptsParam}}{{usecaseName.pascalCase()}}Request request{{/acceptsParam}}) {
    return tryCatchE(
      () async {
        {{#returnsDomainModel}}final response = {{/returnsDomainModel}}await _{{apiName.camelCase()}}RestApi.{{usecaseName.camelCase()}}({{#acceptsParam}}
          _{{usecaseName.camelCase()}}RequestToRemoteMapper.map(request),
        {{/acceptsParam}});
        return right({{#returnsDomainModel}}_{{usecaseName.camelCase()}}ResponseToDomainMapper.map(response),{{/returnsDomainModel}}{{^returnsDomainModel}}unit{{/returnsDomainModel}});
      },
      _errorConverter.handleRemoteError,
    );
  }
}
