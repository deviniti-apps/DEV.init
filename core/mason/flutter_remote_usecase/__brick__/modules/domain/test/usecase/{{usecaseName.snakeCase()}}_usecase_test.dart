import 'package:domain/data_source_action/{{usecaseName.snakeCase()}}_remote_source_action.dart';{{#returnsDomainModel}}
import 'package:domain/model/{{domainModelName.snakeCase()}}.dart';{{/returnsDomainModel}}{{#acceptsParam}}
import 'package:domain/model/{{usecaseName.snakeCase()}}_request.dart';{{/acceptsParam}}
import 'package:domain/model/error_detail.dart';
import 'package:domain/usecase/{{usecaseName.snakeCase()}}_usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class Mock{{usecaseName.pascalCase()}}RemoteSourceAction extends Mock implements {{usecaseName.pascalCase()}}RemoteSourceAction {}

void main() {
  group(
    '{{usecaseName.pascalCase()}}Usecase',
    () {
      {{#acceptsParam}}const fallback{{usecaseName.pascalCase()}}Request = {{usecaseName.pascalCase()}}Request(
        // put your request fields here
      );

      {{/acceptsParam}}{{#returnsDomainModel}}const fallback{{domainModelName.pascalCase()}} = {{domainModelName.pascalCase()}}(
        // put your domain model fields here
      );

      {{/returnsDomainModel}}late Mock{{usecaseName.pascalCase()}}RemoteSourceAction mock{{usecaseName.pascalCase()}}RemoteSourceAction;
      late {{usecaseName.pascalCase()}}Usecase {{usecaseName.camelCase()}}Usecase;{{#acceptsParam}}

      setUpAll(
        () {
          registerFallbackValue(fallback{{usecaseName.pascalCase()}}Request);
          registerFallbackValue(fallback{{domainModelName.pascalCase()}});
        },
      );{{/acceptsParam}}

      setUp(
        () {
          mock{{usecaseName.pascalCase()}}RemoteSourceAction = Mock{{usecaseName.pascalCase()}}RemoteSourceAction();
          {{usecaseName.camelCase()}}Usecase = {{usecaseName.pascalCase()}}Usecase(
            {{usecaseName.camelCase()}}RemoteSourceAction: mock{{usecaseName.pascalCase()}}RemoteSourceAction,
          );
        },
      );

      test(
        'should force the programmer to verify generated tests and/or add custom ones',
        () async => throw Error(),
      );

      test(
        'should return fatal failure when responseCode is null',
        () async {
          when(
            () => mock{{usecaseName.pascalCase()}}RemoteSourceAction.execute({{#acceptsParam}}any(){{/acceptsParam}}),
          ).thenReturn(
            TaskEither.left(const ErrorDetail.backend()),
          );

          final result = await {{usecaseName.camelCase()}}Usecase.execute({{#acceptsParam}}param: fallback{{usecaseName.pascalCase()}}Request{{/acceptsParam}}).run();

          result.match(
            (l) => expect(l, {{usecaseName.pascalCase()}}Failure.fatal),
            (r) => throw r,
          );
        },
      );

      test(
        'should return fatal failure when underlying action returns fatal',
        () async {
          when(
            () => mock{{usecaseName.pascalCase()}}RemoteSourceAction.execute({{#acceptsParam}}any(){{/acceptsParam}}),
          ).thenReturn(
            TaskEither.left(const ErrorDetail.fatal()),
          );

          final result = await {{usecaseName.camelCase()}}Usecase.execute({{#acceptsParam}}param: fallback{{usecaseName.pascalCase()}}Request{{/acceptsParam}}).run();

          result.match(
            (l) => expect(l, {{usecaseName.pascalCase()}}Failure.fatal),
            (r) => throw r,
          );
        },
      );

      test(
        'should return right when underlying action returns right',
        () async {
          when(
            () => mock{{usecaseName.pascalCase()}}RemoteSourceAction.execute({{#acceptsParam}}any(){{/acceptsParam}}),
          ).thenReturn(
            TaskEither.right({{#returnsDomainModel}}fallback{{domainModelName.pascalCase()}}{{/returnsDomainModel}}{{^returnsDomainModel}}unit{{/returnsDomainModel}}),
          );

          final result = await {{usecaseName.camelCase()}}Usecase.execute({{#acceptsParam}}param: fallback{{usecaseName.pascalCase()}}Request{{/acceptsParam}}).run();

          result.match(
            (l) => throw l,
            (r) => expect(r, {{#returnsDomainModel}}fallback{{domainModelName.pascalCase()}}{{/returnsDomainModel}}{{^returnsDomainModel}}unit{{/returnsDomainModel}}),
          );
        },
      );
    },
  );
}
