import 'package:domain/model/user.dart';
import 'package:domain/store/single_value_store.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

enum UpdateLocalUserFailure { fatal }

class UpdateLocalUserUsecase implements ParamUseCase<UpdateLocalUserFailure, Unit, User> {
  const UpdateLocalUserUsecase({
    required SingleValueStore<User> userSingleValueStore,
  }) : _userSingleValueStore = userSingleValueStore;

  final SingleValueStore<User> _userSingleValueStore;

  @override
  TaskEither<UpdateLocalUserFailure, Unit> execute({required User param}) =>
      _userSingleValueStore.write(value: param).bimap(
            (_) => UpdateLocalUserFailure.fatal,
            (unit) => unit,
          );
}
