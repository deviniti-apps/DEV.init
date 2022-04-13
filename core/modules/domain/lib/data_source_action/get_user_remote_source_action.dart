import 'package:domain/model/error_detail.dart';
import 'package:domain/model/user.dart';
import 'package:fpdart/fpdart.dart';

abstract class GetUserRemoteSourceAction {
  TaskEither<ErrorDetail, User> execute();
}
