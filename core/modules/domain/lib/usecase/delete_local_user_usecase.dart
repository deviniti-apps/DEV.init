import 'package:domain/model/user.dart';
import 'package:domain/store/single_value_store.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

enum DeleteLocalUserFailure { fatal }

class DeleteLocalUserUsecase implements UseCase<DeleteLocalUserFailure, Unit> {
  const DeleteLocalUserUsecase({
    required SingleValueStore<User> userSingleValueStore,
  }) : _userSingleValueStore = userSingleValueStore;

  final SingleValueStore<User> _userSingleValueStore;

  @override
  TaskEither<DeleteLocalUserFailure, Unit> execute() => _userSingleValueStore.delete().bimap(
        (_) => DeleteLocalUserFailure.fatal,
        (unit) => unit,
      );
}
