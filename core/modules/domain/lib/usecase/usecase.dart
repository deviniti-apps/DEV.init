import 'package:fpdart/fpdart.dart';

abstract class UseCase<FAILURE, RESULT> {
  TaskEither<FAILURE, RESULT> execute();
}

abstract class ParamUseCase<FAILURE, RESULT, PARAM> {
  TaskEither<FAILURE, RESULT> execute({required PARAM param});
}
