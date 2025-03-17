import 'package:domain/data_source_action/get_user_remote_source_action.dart';
import 'package:domain/model/error_detail.dart';
import 'package:domain/model/user.dart';
import 'package:domain/usecase/get_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUserRemoteSourceAction extends Mock implements GetUserRemoteSourceAction {}

void main() {
  group(
    'GetUserRemoteSourceAction',
    () {
      late MockGetUserRemoteSourceAction mockGetUserRemoteSourceAction;
      late GetUserUsecase getUserUsecase;

      setUp(
        () {
          mockGetUserRemoteSourceAction = MockGetUserRemoteSourceAction();

          getUserUsecase = GetUserUsecase(
            getUserRemoteSourceAction: mockGetUserRemoteSourceAction,
          );
        },
      );

      test(
        'Should return user when no error has occurred',
        () async {
          const user = User(name: 'name', email: 'name@example.com');

          when(() => mockGetUserRemoteSourceAction.execute()).thenReturn(TaskEither<ErrorDetail, User>.right(user));

          final result = await getUserUsecase.execute().run();

          result.match(
            (it) => throw it,
            (it) => expect(it, user),
          );
        },
      );

      test(
        'Should return fatal error detail when getting current user fails',
        () async {
          when(() => mockGetUserRemoteSourceAction.execute())
              .thenReturn(TaskEither<ErrorDetail, User>.left(const ErrorDetail.fatal()));

          final result = await getUserUsecase.execute().run();

          result.match(
            (it) => expect(it, GetUserFailure.fatal),
            (it) => throw it,
          );
        },
      );

      test(
        'Should return fatal error detail when backend error occurred',
        () async {
          when(() => mockGetUserRemoteSourceAction.execute()).thenReturn(
            TaskEither<ErrorDetail, User>.left(
              const ErrorDetail.backend(errorCode: 'api_error', message: 'api_message'),
            ),
          );

          final result = await getUserUsecase.execute().run();

          result.match(
            (it) => expect(it, GetUserFailure.fatal),
            (it) => throw it,
          );
        },
      );
    },
  );
}
