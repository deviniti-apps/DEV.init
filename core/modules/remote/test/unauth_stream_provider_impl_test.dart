import 'package:fpdart/fpdart.dart';
import 'package:remote/other/unauth_stream_provider_impl.dart';
import 'package:test/test.dart';

void main() {
  group(
    'UnAuthStreamProviderImpl',
    () {
      test(
        'Checks whether call of unauthenticated method emits event in stream',
        () {
          final unAuthStreamProviderImpl = UnAuthStreamProviderImpl()..unauthenticated();

          unAuthStreamProviderImpl.stream.listen(
            expectAsync1(
              (event) {
                expect(event, equals(unit));
              },
            ),
          );
        },
      );
    },
  );
}
