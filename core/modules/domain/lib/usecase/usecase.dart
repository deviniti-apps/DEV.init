import 'package:fpdart/fpdart.dart';

abstract class UseCase<T, E> {
  TaskEither<T, E> execute();
}

abstract class ParamUseCase<T, E, U> {
  TaskEither<T, E> execute({required U param});
}
