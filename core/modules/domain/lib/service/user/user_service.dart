import 'package:domain/data_source/user_remote_data_source.dart';
import 'package:domain/failure/failure.dart';
import 'package:foundation/unit.dart';
import 'package:domain/model/user.dart';
import 'package:foundation/either.dart';

abstract class UserService {
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, Unit>> register({
    required String uid,
    required String token,
  });
}

class UserServiceImpl implements UserService {
  const UserServiceImpl({
    required UserRemoteDataSource userRemoteDataSource,
  }) : _userRemoteDataSource = userRemoteDataSource;

  final UserRemoteDataSource _userRemoteDataSource;

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    final user = await _userRemoteDataSource.getCurrentUser();
    return user.fold(left, right);
  }

  @override
  Future<Either<Failure, Unit>> register({
    required String uid,
    required String token,
  }) async {
    final result = await _userRemoteDataSource.register(uid: uid, token: token);
    return result.fold(left, right);
  }
}
