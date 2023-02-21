import 'package:domain/model/user.dart';
import 'package:domain/usecase/delete_local_user_usecase.dart';
import 'package:domain/usecase/get_local_user_usecase.dart';
import 'package:domain/usecase/update_local_user_usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rxdart/rxdart.dart';

abstract class UserProvider {
  Future<void> restoreUser();

  TaskEither<UpdateLocalUserFailure, Unit> updateUser(User user);

  Future<void> deleteUser();

  Stream<User?> get userStream;

  User? get user;
}

class UserProviderImpl extends UserProvider {
  UserProviderImpl({
    required GetLocalUserUsecase getLocalUserUsecase,
    required DeleteLocalUserUsecase deleteLocalUserUsecase,
    required UpdateLocalUserUsecase updateLocalUserUsecase,
  })  : _getLocalUserUsecase = getLocalUserUsecase,
        _deleteLocalUserUsecase = deleteLocalUserUsecase,
        _updateLocalUserUsecase = updateLocalUserUsecase;

  final GetLocalUserUsecase _getLocalUserUsecase;
  final DeleteLocalUserUsecase _deleteLocalUserUsecase;
  final UpdateLocalUserUsecase _updateLocalUserUsecase;

  final _streamController = BehaviorSubject<User?>();

  @override
  Future<void> restoreUser() => _getLocalUserUsecase
      .execute()
      .match(
        (_) => deleteUser(),
        _streamController.add,
      )
      .run();

  @override
  TaskEither<UpdateLocalUserFailure, Unit> updateUser(User user) => _updateLocalUserUsecase.execute(param: user).bimap(
        (l) => l,
        (r) {
          _streamController.add(user);
          return r;
        },
      );

  @override
  Future<void> deleteUser() async {
    await _deleteLocalUserUsecase.execute().run();
    _streamController.add(null);
  }

  @override
  Stream<User?> get userStream => _streamController.stream;

  @override
  User? get user => _streamController.hasValue ? _streamController.value : null;
}
