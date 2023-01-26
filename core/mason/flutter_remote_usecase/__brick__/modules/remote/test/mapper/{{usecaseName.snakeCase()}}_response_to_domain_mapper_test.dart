import 'package:domain/model/{{domainModelName.snakeCase()}}.dart';
import 'package:remote/mapper/{{usecaseName.snakeCase()}}_response_to_domain_mapper.dart';
import 'package:remote/models/{{apiName.snakeCase()}}/{{usecaseName.snakeCase()}}_response_remote_model.dart';
import 'package:test/test.dart';

void main() {
  group(
    '{{usecaseName.pascalCase()}}ResponseToDomainMapper',
    () {
      late {{usecaseName.pascalCase()}}ResponseToDomainMapper {{usecaseName.camelCase()}}ResponseToDomainMapper;

      setUp(
        () => {{usecaseName.camelCase()}}ResponseToDomainMapper = const {{usecaseName.pascalCase()}}ResponseToDomainMapper(),
      );

      test(
        'should correctly map response',
        () {
          const response = {{usecaseName.pascalCase()}}ResponseRemoteModel(
            // put your response remote model fields here
          );

          const expectedResult = {{domainModelName.pascalCase()}}(
            // put your domain model fields here
          );

          final result = {{usecaseName.camelCase()}}ResponseToDomainMapper.map(response);

          expect(result, expectedResult);
        },
      );
    },
  );
}
