import 'package:domain/model/{{usecaseName.snakeCase()}}_request.dart';
import 'package:remote/mapper/mapper.dart';
import 'package:remote/models/{{apiName.snakeCase()}}/{{usecaseName.snakeCase()}}_request_remote_model.dart';

class {{usecaseName.pascalCase()}}RequestToRemoteMapper implements Mapper<{{usecaseName.pascalCase()}}Request, {{usecaseName.pascalCase()}}RequestRemoteModel> {
  const {{usecaseName.pascalCase()}}RequestToRemoteMapper();

  @override
  {{usecaseName.pascalCase()}}RequestRemoteModel map({{usecaseName.pascalCase()}}Request request) {
    return {{usecaseName.pascalCase()}}RequestRemoteModel(
      // put request remote model fields here
    );
  }
}
