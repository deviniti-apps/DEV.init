import 'package:dio/dio.dart';
import 'package:domain/data_source/user_remote_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:remote/data_source/user/user_remote_data_source_impl.dart';
import 'package:remote/data_source/user/user_rest_api.dart';
import 'package:remote/dio_provider.dart';
import 'package:domain/auth_token_provider.dart';

extension RemoteInjector on GetIt {
  void registerRemote({
    required String baseUrl,
  }) {
    this
      ..registerFactory<PrettyDioLogger>(
        () => PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      )
      ..registerFactory<Dio>(
        () => DioProvider.create(
          baseUrl: baseUrl,
          logger: get<PrettyDioLogger>(),
          addAuthorizationInterceptor: true,
          authTokenProvider: get<AuthTokenProvider>(),
        ),
        instanceName: DioProvider.dioAuth,
      )
      ..registerFactory<Dio>(
        () => DioProvider.create(
          baseUrl: baseUrl,
          logger: get<PrettyDioLogger>(),
          addAuthorizationInterceptor: false,
          authTokenProvider: get<AuthTokenProvider>(),
        ),
        instanceName: DioProvider.dioNoAuth,
      )
      ..registerFactory<UserRestApi>(
        () => UserRestApi(get(instanceName: DioProvider.dioAuth)),
      )
      ..registerFactory<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl(userRestApi: get()),
      );
  }
}
