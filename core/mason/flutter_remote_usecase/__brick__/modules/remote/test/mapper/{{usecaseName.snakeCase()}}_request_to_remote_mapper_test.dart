import 'package:domain/model/{{usecaseName.snakeCase()}}_request.dart';
import 'package:remote/mapper/{{usecaseName.snakeCase()}}_request_to_remote_mapper.dart';
import 'package:remote/models/{{apiName.snakeCase()}}/{{usecaseName.snakeCase()}}_request_remote_model.dart';
import 'package:test/test.dart';

void main() {
  group(
    '{{usecaseName.pascalCase()}}RequestToRemoteMapper',
    () {
      late {{usecaseName.pascalCase()}}RequestToRemoteMapper {{usecaseName.camelCase()}}RequestToRemoteMapper;

      setUp(
        () => {{usecaseName.camelCase()}}RequestToRemoteMapper = const {{usecaseName.pascalCase()}}RequestToRemoteMapper(),
      );

      test(
        'should correctly map request',
        () {
          const request = {{usecaseName.pascalCase()}}Request(
            // put your request fields here
          );

          const expectedResult = {{usecaseName.pascalCase()}}RequestRemoteModel(
            // put your request remote model fields here
          );

          final result = {{usecaseName.camelCase()}}RequestToRemoteMapper.map(request);

          expect(result, expectedResult);
        },
      );
    },
  );
}
