import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:domain/model/error_detail.dart';
import 'package:remote/models/error/error_object.dart';

class ErrorConverter {
  const ErrorConverter();

  ErrorDetail? convert<BodyType>(Object? error) {
    if (error == null) {
      return null;
    }

    if (error is! String) {
      return const ErrorDetail.fatal();
    }

    try {
      final errorObject = ErrorObject.fromJson(jsonDecode(error) as Map<String, dynamic>);
      return ErrorDetail.backend(
        traceId: errorObject.traceId,
        errorCode: errorObject.error,
        message: errorObject.message,
        timestamp: errorObject.timestamp,
      );
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      return const ErrorDetail.fatal();
    }
  }

  ErrorDetail handleRemoteError(Object error, StackTrace stackTrace) {
    if (error is DioError && error.type == DioErrorType.badResponse) {
      return convert(error) ?? const ErrorDetail.fatal();
    }
    return ErrorDetail.fatal(throwable: error, stackTrace: stackTrace);
  }
}
