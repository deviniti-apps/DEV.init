import 'package:fpdart/fpdart.dart';

abstract class UseCase<FAILURE, RESULT> {
  Future<Either<FAILURE, RESULT>> execute();
}

abstract class ParamUseCase<FAILURE, RESULT, PARAM> {
  Future<Either<FAILURE, RESULT>> execute({required PARAM param});
}
