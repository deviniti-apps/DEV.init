import 'package:domain/model/{{domainModelName.snakeCase()}}.dart';
import 'package:remote/mapper/mapper.dart';
import 'package:remote/models/{{apiName.snakeCase()}}/{{usecaseName.snakeCase()}}_response_remote_model.dart';

class {{usecaseName.pascalCase()}}ResponseToDomainMapper implements Mapper<{{usecaseName.pascalCase()}}ResponseRemoteModel, {{domainModelName.pascalCase()}}> {
  const {{usecaseName.pascalCase()}}ResponseToDomainMapper();

  @override
  {{domainModelName.pascalCase()}} map({{usecaseName.pascalCase()}}ResponseRemoteModel element) {
    return {{domainModelName.pascalCase()}}(
      // put your domain model fields here
    );
  }
}
