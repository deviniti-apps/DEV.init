import 'package:domain/data_source_action/get_user_remote_source_action.dart';
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
  Future<Either<GetUserFailure, User>> execute() async {
    return (await _getUserRemoteSourceAction.execute()).fold(
      (errorDetail) => errorDetail.map(
        backend: (backendError) {
          switch (backendError.errorCode) {
            default:
              return left(GetUserFailure.fatal);
          }
        },
        fatal: (fatalError) => left(GetUserFailure.fatal),
      ),
      right,
    );
  }
}
