import 'package:flutter_test/flutter_test.dart';
import 'package:remote/models/error/error_object.dart';

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
        () {
          final result = ErrorObject.fromJson(jsonMap);

          expect(result, errorObject);
        },
      );

      test(
        'should create json from error object',
        () {
          final result = errorObject.toJson();

          expect(result, jsonMap);
        },
      );
    },
  );
}
