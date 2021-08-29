import 'package:domain/failure/failure.dart';
import 'package:dio/src/dio_error.dart';
import 'package:remote/data_source/user/user_remote_data_source_impl.dart';

extension UserFailureMapper on UserRemoteDataSourceImpl {
  Failure mapDioFailure(DioError dioError) {
    if (dioError.type == DioErrorType.response) {
      return const Failure.defaultType(); //TODO: map here api errors to errorBody
    } else {
      switch (dioError.type) {
        case DioErrorType.connectTimeout:
          return const Failure.connectTimeout();
        case DioErrorType.sendTimeout:
          return const Failure.sendTimeout();
        case DioErrorType.receiveTimeout:
          return const Failure.receiveTimeout();
        case DioErrorType.cancel:
          return const Failure.cancel();
        default:
          return const Failure.defaultType();
      }
    }
  }
}
