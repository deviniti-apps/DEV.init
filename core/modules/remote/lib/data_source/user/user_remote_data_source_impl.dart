import 'package:domain/model/user.dart';
import 'package:foundation/either.dart';
import 'package:foundation/unit.dart';
import 'package:remote/data_source/user/model/request/register_user_remote_model.dart';
import 'package:remote/data_source/user/model/response/user_remote_model.dart';
import 'package:remote/data_source/user/user_rest_api.dart';
import 'package:remote/data_source/user/user_failure_mapper.dart';
import 'package:domain/data_source/user_remote_data_source.dart';
import 'package:domain/failure/failure.dart';
import 'package:dio/src/dio_error.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl({required UserRestApi userRestApi}) : _userRestApi = userRestApi;

  final UserRestApi _userRestApi;

  @override
  Future<Either<Failure, Unit>> register({String? uid, String? token}) async {
    try {
      final registerUserRemoteModel = RegisterUserRemoteModel(uid: uid, token: token);
      await _userRestApi.registerUser(registerUserRemoteModel);
      return right(unit);
    } on DioError catch (e) {
      return left(mapDioFailure(e));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final remoteUser = await _userRestApi.getCurrentUser();
      return right(remoteUser.toUser());
    } on DioError catch (e) {
      return left(mapDioFailure(e));
    }
  }
}
