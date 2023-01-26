{{#returnsDomainModel}}import 'package:domain/model/{{domainModelName.snakeCase()}}.dart';
{{/returnsDomainModel}}import 'package:domain/model/error_detail.dart';{{#acceptsParam}}
import 'package:domain/model/{{usecaseName.snakeCase()}}_request.dart';{{/acceptsParam}}{{^returnsDomainModel}}
import 'package:fpdart/fpdart.dart';{{/returnsDomainModel}}
import 'package:mocktail/mocktail.dart';
import 'package:remote/api/{{apiName.snakeCase()}}_rest_api.dart';
import 'package:remote/data_source_action/{{usecaseName.snakeCase()}}_remote_source_action_impl.dart';
import 'package:remote/mapper/mapper.dart';{{#acceptsParam}}
import 'package:remote/models/{{apiName.snakeCase()}}/{{usecaseName.snakeCase()}}_request_remote_model.dart';{{/acceptsParam}}{{#returnsDomainModel}}
import 'package:remote/models/{{apiName.snakeCase()}}/{{usecaseName.snakeCase()}}_response_remote_model.dart';
import 'package:remote/models/response_wrapper.dart';{{/returnsDomainModel}}
import 'package:remote/other/error/error_converter.dart';
import 'package:test/test.dart';

class Mock{{apiName.pascalCase()}}RestApi extends Mock implements {{apiName.pascalCase()}}RestApi {}

class MockErrorConverter extends Mock implements ErrorConverter {}{{#acceptsParam}}

class MockToRemoteMapper extends Mock implements Mapper<{{usecaseName.pascalCase()}}Request, {{usecaseName.pascalCase()}}RequestRemoteModel> {}{{/acceptsParam}}{{#returnsDomainModel}}

class MockToDomainMapper extends Mock implements Mapper<{{usecaseName.pascalCase()}}ResponseRemoteModel, {{domainModelName.pascalCase()}}> {}{{/returnsDomainModel}}

class FakeStackTrace extends Fake implements StackTrace {}

void main() {
  group(
    '{{usecaseName.pascalCase()}}RemoteSourceActionImpl',
    () {
      {{#acceptsParam}}const fallback{{usecaseName.pascalCase()}}Request = {{usecaseName.pascalCase()}}Request(
        // put your request fields here
      );

      const fallback{{usecaseName.pascalCase()}}RequestRemoteModel = {{usecaseName.pascalCase()}}RequestRemoteModel(
        // put your request remote model fields here
      );

      {{/acceptsParam}}{{#returnsDomainModel}}const fallback{{usecaseName.pascalCase()}}ResponseRemoteModel = {{usecaseName.pascalCase()}}ResponseRemoteModel(
        // put your response remote model fields here
      );

      const fallback{{domainModelName.pascalCase()}} = {{domainModelName.pascalCase()}}(
        // put your domain model fields here
      );

      {{/returnsDomainModel}}late Mock{{apiName.pascalCase()}}RestApi mock{{apiName.pascalCase()}}RestApi;
      late MockErrorConverter mockErrorConverter;{{#acceptsParam}}
      late MockToRemoteMapper mockToRemoteMapper;{{/acceptsParam}}{{#returnsDomainModel}}
      late MockToDomainMapper mockToDomainMapper;{{/returnsDomainModel}}
      late {{usecaseName.pascalCase()}}RemoteSourceActionImpl {{usecaseName.camelCase()}}RemoteSourceActionImpl;

      setUpAll(
        () {
        {{#acceptsParam}}registerFallbackValue(fallback{{usecaseName.pascalCase()}}Request);
        registerFallbackValue(fallback{{usecaseName.pascalCase()}}RequestRemoteModel);
        {{/acceptsParam}}{{#returnsDomainModel}}registerFallbackValue(fallback{{usecaseName.pascalCase()}}ResponseRemoteModel);
        registerFallbackValue(fallback{{domainModelName.pascalCase()}});
        {{/returnsDomainModel}}registerFallbackValue(FakeStackTrace());
        },
      );

      setUp(
        () {
          mock{{apiName.pascalCase()}}RestApi = Mock{{apiName.pascalCase()}}RestApi();
          mockErrorConverter = MockErrorConverter();{{#acceptsParam}}
          mockToRemoteMapper = MockToRemoteMapper();{{/acceptsParam}}{{#returnsDomainModel}}
          mockToDomainMapper = MockToDomainMapper();{{/returnsDomainModel}}
          {{usecaseName.camelCase()}}RemoteSourceActionImpl = {{usecaseName.pascalCase()}}RemoteSourceActionImpl(
            {{apiName.camelCase()}}RestApi: mock{{apiName.pascalCase()}}RestApi,
            errorConverter: mockErrorConverter,{{#acceptsParam}}
            {{usecaseName.camelCase()}}RequestToRemoteMapper: mockToRemoteMapper,{{/acceptsParam}}{{#returnsDomainModel}}
            {{usecaseName.camelCase()}}ResponseToDomainMapper: mockToDomainMapper,{{/returnsDomainModel}}
          );
        },
      );

      test(
        'should force the programmer to verify generated tests and/or add custom ones',
        () async => throw Error(),
      );

      test(
        'should return ErrorDetail.fatal when an exception occurs',
        () async {
          {{#acceptsParam}}when(
            () => mockToRemoteMapper.map(any()),
          ).thenReturn(
            fallback{{usecaseName.pascalCase()}}RequestRemoteModel,
          );
          {{/acceptsParam}}when(
            () => mock{{apiName.pascalCase()}}RestApi.{{usecaseName.camelCase()}}({{#acceptsParam}}fallback{{usecaseName.pascalCase()}}RequestRemoteModel{{/acceptsParam}}),
          ).thenThrow(
            Exception(),
          );
          when(
            () => mockErrorConverter.handleRemoteError(any(), any()),
          ).thenReturn(
            const ErrorDetail.fatal(),
          );

          final result = await {{usecaseName.camelCase()}}RemoteSourceActionImpl.execute({{#acceptsParam}}fallback{{usecaseName.pascalCase()}}Request{{/acceptsParam}});

          result.match(
            (l) => expect(l, const ErrorDetail.fatal()),
            (r) => throw r,
          );
        },
      );

      test(
        'should return {{#returnsDomainModel}}a {{domainModelName.pascalCase()}}{{/returnsDomainModel}}{{^returnsDomainModel}}unit{{/returnsDomainModel}} when there is no error',
        () async {
          {{#acceptsParam}}when(
            () => mockToRemoteMapper.map(any()),
          ).thenReturn(
            fallback{{usecaseName.pascalCase()}}RequestRemoteModel,
          );

          {{/acceptsParam}}when(
            () => mock{{apiName.pascalCase()}}RestApi.{{usecaseName.camelCase()}}({{#acceptsParam}}fallback{{usecaseName.pascalCase()}}RequestRemoteModel{{/acceptsParam}}),
          ).thenAnswer({{#returnsDomainModel}}
            (_) async => const ResponseWrapper(
              status: 200,
              responseCode: 0,
              message: 'OK',
              data: fallback{{usecaseName.pascalCase()}}ResponseRemoteModel,
            ),{{/returnsDomainModel}}{{^returnsDomainModel}}
            (_) async => unit,{{/returnsDomainModel}}
          );{{#returnsDomainModel}}

          when(
            () => mockToDomainMapper.map(fallback{{usecaseName.pascalCase()}}ResponseRemoteModel),
          ).thenReturn(
            fallback{{domainModelName.pascalCase()}},
          );{{/returnsDomainModel}}

          final result = await {{usecaseName.camelCase()}}RemoteSourceActionImpl.execute({{#acceptsParam}}fallback{{usecaseName.pascalCase()}}Request{{/acceptsParam}});

          result.match(
            (l) => throw l,
            (r) => expect(r, {{#returnsDomainModel}}fallback{{domainModelName.pascalCase()}}{{/returnsDomainModel}}{{^returnsDomainModel}}unit{{/returnsDomainModel}}),
          );

          {{#acceptsParam}}verify(() => mockToRemoteMapper.map(fallback{{usecaseName.pascalCase()}}Request)).called(1);
          verifyNoMoreInteractions(mockToRemoteMapper);
          {{/acceptsParam}}verify(() => mock{{apiName.pascalCase()}}RestApi.{{usecaseName.camelCase()}}({{#acceptsParam}}fallback{{usecaseName.pascalCase()}}RequestRemoteModel{{/acceptsParam}})).called(1);
          verifyNoMoreInteractions(mock{{apiName.pascalCase()}}RestApi);{{#returnsDomainModel}}
          verify(() => mockToDomainMapper.map(fallback{{usecaseName.pascalCase()}}ResponseRemoteModel)).called(1);
          verifyNoMoreInteractions(mockToDomainMapper);{{/returnsDomainModel}}
        },
      );
    },
  );
}
