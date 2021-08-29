import 'package:domain/failure/failure.dart';
import 'package:domain/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:foundation/either.dart';
import 'package:foundation/unit.dart';

abstract class UserRemoteDataSource {
  Future<Either<Failure, Unit>> register({@required String uid, @required String token});
  Future<Either<Failure, User>> getCurrentUser();
}
