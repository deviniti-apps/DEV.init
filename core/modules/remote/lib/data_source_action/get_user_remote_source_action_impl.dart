import 'package:domain/data_source_action/get_user_remote_source_action.dart';
import 'package:domain/model/error_detail.dart';
import 'package:domain/model/user.dart';
import 'package:foundation/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:remote/api/user_rest_api.dart';
import 'package:remote/mapper/mapper.dart';
import 'package:remote/models/user/user_remote_model.dart';
import 'package:remote/other/error/error_converter.dart';

class GetUserRemoteSourceActionImpl implements GetUserRemoteSourceAction {
  const GetUserRemoteSourceActionImpl({
    required UserRestApi userRestApi,
    required ErrorConverter errorConverter,
    required Mapper<UserRemoteModel, User> userRemoteToUserMapper,
  })  : _userRestApi = userRestApi,
        _errorConverter = errorConverter,
        _userRemoteToUserMapper = userRemoteToUserMapper;

  final UserRestApi _userRestApi;
  final ErrorConverter _errorConverter;
  final Mapper<UserRemoteModel, User> _userRemoteToUserMapper;

  @override
  TaskEither<ErrorDetail, User> execute() {
    return tryCatchE<ErrorDetail, User>(
      () async {
        final response = await _userRestApi.getCurrentUser();
        return right(_userRemoteToUserMapper.map(response));
      },
      _errorConverter.handleRemoteError,
    );
  }
}
