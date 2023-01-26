import 'dart:io';

import 'package:mason/mason.dart';
import 'package:recase/recase.dart';

void run(HookContext context) {
  final path = Directory.current.path;
  final domainPath = "${path}/modules/domain";
  final remotePath = "${path}/modules/remote";
  final apiNameSnake = ReCase(context.vars['apiName']).snakeCase;
  final domainModelNameSnake = ReCase(context.vars['domainModelName']).snakeCase;
  final usecaseNameSnake = ReCase(context.vars['usecaseName']).snakeCase;

  if (!context.vars['returnsDomainModel']) {
    final domainModelFile = "${domainPath}/lib/model/${domainModelNameSnake}.dart";
    File(domainModelFile).delete();

    final responseRemoteModelFile =
        "${remotePath}/lib/models/${apiNameSnake}/${usecaseNameSnake}_response_remote_model.dart";
    File(responseRemoteModelFile).delete();

    final toDomainMapperFile = "${remotePath}/lib/mapper/${usecaseNameSnake}_response_to_domain_mapper.dart";
    File(toDomainMapperFile).delete();

    final toDomainMapperTestFile = "${remotePath}/test/mapper/${usecaseNameSnake}_response_to_domain_mapper_test.dart";
    File(toDomainMapperTestFile).delete();
  }

  if (!context.vars['acceptsParam']) {
    final requestFile = "${domainPath}/lib/model/${usecaseNameSnake}_request.dart";
    File(requestFile).delete();

    final requestRemoteModelFile =
        "${remotePath}/lib/models/${apiNameSnake}/${usecaseNameSnake}_request_remote_model.dart";
    File(requestRemoteModelFile).delete();

    final toRemoteMapperFile = "${remotePath}/lib/mapper/${usecaseNameSnake}_request_to_remote_mapper.dart";
    File(toRemoteMapperFile).delete();

    final toRemoteMapperTestFile = "${remotePath}/test/mapper/${usecaseNameSnake}_request_to_remote_mapper_test.dart";
    File(toRemoteMapperTestFile).delete();
  }
}
