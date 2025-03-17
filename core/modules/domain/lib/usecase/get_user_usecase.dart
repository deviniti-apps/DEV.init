import 'package:domain/data_source_action/get_user_remote_source_action.dart';
import 'package:domain/model/error_detail.dart';
import 'package:domain/model/user.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

enum GetUserFailure { fatal }

class GetUserUsecase implements UseCase<GetUserFailure, User> {
  const GetUserUsecase({
    required GetUserRemoteSourceAction getUserRemoteSourceAction,
  }) : _getUserRemoteSourceAction = getUserRemoteSourceAction;

  final GetUserRemoteSourceAction _getUserRemoteSourceAction;

  @override
  TaskEither<GetUserFailure, User> execute() {
    return _getUserRemoteSourceAction.execute().bimap(
          (errorDetail) => switch (errorDetail) {
            ErrorDetailBackend(:final errorCode) => switch (errorCode) {
                _ => GetUserFailure.fatal,
              },
            _ => GetUserFailure.fatal,
          },
          (r) => r,
        );
  }
}
