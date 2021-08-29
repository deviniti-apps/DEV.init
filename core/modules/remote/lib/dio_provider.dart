import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:domain/auth_token_provider.dart';

class DioProvider {
  static String dioAuth = 'DioAuth';
  static String dioNoAuth = 'DioNoAuth';

  static Dio create({
    required String baseUrl,
    required PrettyDioLogger logger,
    required AuthTokenProvider authTokenProvider,
    required bool addAuthorizationInterceptor,
  }) {
    final dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.responseType = ResponseType.json;

    if (addAuthorizationInterceptor) {
      dio.interceptors.add(_authorizationInterceptor(authTokenProvider));
    }

    if (!kReleaseMode) {
      dio.interceptors.add(logger);
    }

    return dio;
  }

  static InterceptorsWrapper _authorizationInterceptor(AuthTokenProvider authTokenProvider) {
    return InterceptorsWrapper(
      onRequest: (options, interceptorHandler) async {
        final token = await authTokenProvider.token;
        if (token.isNotEmpty) {
          options.headers.addAll(
            {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          );
        }
      },
    );
  }
}
