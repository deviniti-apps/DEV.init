import 'package:dio/dio.dart' hide Headers;
import 'package:remote/data_source/user/model/request/register_user_remote_model.dart';
import 'package:remote/data_source/user/model/response/user_remote_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_rest_api.g.dart';

@RestApi()
abstract class UserRestApi {
  factory UserRestApi(Dio dio) = _UserRestApi;

  @POST('/user/register')
  Future<void> registerUser(@Body() RegisterUserRemoteModel registerUserRemoteModel);

  @GET('/user/current')
  Future<UserRemoteModel> getCurrentUser();
}
