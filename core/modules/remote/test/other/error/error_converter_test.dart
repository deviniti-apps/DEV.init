import 'package:dio/dio.dart';
import 'package:domain/model/error_detail.dart';
import 'package:remote/other/error/error_converter.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Given correct json error body provided it returns ErrorDetail',
    () {
      const converter = ErrorConverter();

      const errorBody = '''
      {
        "timestamp": "2022-02-16T14:18:51.284Z",
        "error": "missing_filter",
        "message": "Mandatory filter parameter is missing",
        "traceId": "traceId"
      }
      ''';

      final result = converter.convert(errorBody);

      expect(
        result,
        ErrorDetail.backend(
          traceId: 'traceId',
          errorCode: 'missing_filter',
          message: 'Mandatory filter parameter is missing',
          timestamp: DateTime.parse('2022-02-16T14:18:51.284Z'),
        ),
      );
    },
  );

  test(
    'Given incorrect property of json error body provided it returns ErrorDetail.fatal',
    () {
      const converter = ErrorConverter();

      const errorBody = '''
      {
        "timestamp": "2022-02-16T14:18:51.284Z",
        "error": "missing_filter",
        "message": "Mandatory filter parameter is missing",
        "traceId": 1
      }
      ''';

      final result = converter.convert(errorBody);

      expect(
        result,
        const ErrorDetail.fatal(),
      );
    },
  );

  test(
    'Given null json error body provided it returns null',
    () {
      const converter = ErrorConverter();

      final result = converter.convert(null);

      expect(
        result,
        null,
      );
    },
  );

  test(
    'Given corrupted json error body provided it returns ErrorDetail.fatal',
    () {
      const converter = ErrorConverter();

      final result = converter.convert('aaaaaaaaa');

      expect(
        result,
        const ErrorDetail.fatal(),
      );
    },
  );

  test(
    'Given not string json error body provided it returns ErrorDetail.fatal',
    () {
      const converter = ErrorConverter();

      final result = converter.convert(10);

      expect(
        result,
        const ErrorDetail.fatal(),
      );
    },
  );

  test(
    'Given not DioError type error and stack trace then function handleRemoteError returns ErrorDetail.fatal',
    () {
      const converter = ErrorConverter();
      final stackTrace = StackTrace.fromString('stackTraceString');

      final result = converter.handleRemoteError(10, stackTrace);

      expect(
        result,
        ErrorDetail.fatal(throwable: 10, stackTrace: stackTrace),
      );
    },
  );

  test(
    'Given DioError type error and stack trace then function handleRemoteError returns ErrorDetail.fatal',
    () {
      const converter = ErrorConverter();
      final dioError = DioError(requestOptions: RequestOptions(path: 'path'), type: DioErrorType.badResponse);
      final stackTrace = StackTrace.fromString('stackTraceString');

      final result = converter.handleRemoteError(dioError, stackTrace);

      expect(
        result,
        const ErrorDetail.fatal(),
      );
    },
  );
}
