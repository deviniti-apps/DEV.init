import 'package:remote/models/error/error_object.dart';
import 'package:test/test.dart';

void main() {
  group(
    'ErrorObject',
    () {
      final errorObject = ErrorObject(
        timestamp: DateTime(2023),
        error: 'error',
        message: 'message',
        traceId: 'traceId',
      );

      final jsonMap = <String, dynamic>{
        'timestamp': DateTime(2023).toIso8601String(),
        'error': 'error',
        'message': 'message',
        'traceId': 'traceId',
      };

      test(
        'should create error object from json',
        () async {
          final result = ErrorObject.fromJson(jsonMap);

          expect(result, errorObject);
        },
      );

      test(
        'should create json from error object',
        () async {
          final result = errorObject.toJson();

          expect(result, jsonMap);
        },
      );
    },
  );
}
