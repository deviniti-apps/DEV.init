import 'package:foundation/app_logger/app_logger.dart';
import 'package:fpdart/fpdart.dart';

extension $TaskEither<L, R> on TaskEither<L, R> {
  TaskEither<C, R> mapLeft<C>(C Function(L a) f) {
    return TaskEither<C, R>(() async => (await run()).match((l) => left(f(l)), right));
  }
}

TaskEither<L, R> tryCatchE<L, R>(
  Future<Either<L, R>> Function() run,
  L Function(Object error, StackTrace stackTrace) onError,
) {
  return TaskEither<L, R>(
    () async {
      try {
        return await run();
        // ignore: avoid_catches_without_on_clauses
      } catch (error, stackTrace) {
        logSevere('tryCatchE', error, stackTrace);
        return Left<L, R>(onError(error, stackTrace));
      }
    },
  );
}
