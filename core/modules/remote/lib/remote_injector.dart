// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:dio/dio.dart';
import 'package:domain/auth_token_provider.dart';
import 'package:domain/data_source_action/get_user_remote_source_action.dart';
import 'package:domain/model/user.dart';
import 'package:domain/unauth_stream_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:remote/api/user_rest_api.dart';
import 'package:remote/data_source_action/get_user_remote_source_action_impl.dart';
import 'package:remote/dio_provider.dart';
import 'package:remote/mapper/mapper.dart';
import 'package:remote/mapper/user_remote_to_user_mapper.dart';
import 'package:remote/models/user/user_remote_model.dart';
import 'package:remote/other/error/error_converter.dart';
import 'package:remote/other/unauth_stream_provider_impl.dart';

extension RemoteInjector on GetIt {
  void registerRemote({
    required String baseUrl,
  }) {
    this
      .._registerMappers()
      .._registerApi()
      .._registerRemoteSourceAction()
      ..registerSingleton<UnAuthStreamProvider>(UnAuthStreamProviderImpl())
      ..registerSingleton(const ErrorConverter())
      ..registerFactory<Dio>(
        () => DioProvider.create(
          baseUrl: baseUrl,
          addAuthorizationInterceptor: true,
          authTokenProvider: get<AuthTokenProvider>(),
        ),
        instanceName: DioProvider.dioAuth,
      )
      ..registerFactory<Dio>(
        () => DioProvider.create(
          baseUrl: baseUrl,
          addAuthorizationInterceptor: false,
          authTokenProvider: get<AuthTokenProvider>(),
        ),
        instanceName: DioProvider.dioNoAuth,
      );
  }

  void _registerRemoteSourceAction() {
    this
      ..registerFactory<GetUserRemoteSourceAction>(
        () => GetUserRemoteSourceActionImpl(
          userRestApi: get(),
          errorConverter: get(),
          userRemoteToUserMapper: get(),
        ),
      );
  }

  void _registerApi() {
    this
      ..registerFactory<UserRestApi>(
        () => UserRestApi(get(instanceName: DioProvider.dioNoAuth)),
      );
  }

  void _registerMappers() {
    this
      ..registerFactory<Mapper<UserRemoteModel, User>>(
        () => const UserRemoteToUserMapper(),
      );
  }
}
