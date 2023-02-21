import 'package:domain/model/user.dart';
import 'package:domain/store/single_value_store.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

enum GetLocalUserFailure { fatal }

class GetLocalUserUsecase implements UseCase<GetLocalUserFailure, User> {
  const GetLocalUserUsecase({
    required SingleValueStore<User> userSingleValueStore,
  }) : _userSingleValueStore = userSingleValueStore;

  final SingleValueStore<User> _userSingleValueStore;

  @override
  TaskEither<GetLocalUserFailure, User> execute() => _userSingleValueStore.read().bimap(
        (_) => GetLocalUserFailure.fatal,
        (user) => user,
      );
}
