import 'package:domain/data_source_action/get_user_remote_source_action.dart';
import 'package:domain/model/error_detail.dart';
import 'package:domain/model/user.dart';
import 'package:domain/usecase/get_user_usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

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

          when(() => mockGetUserRemoteSourceAction.execute()).thenAnswer((_) async => right(user));

          final result = await getUserUsecase.execute();

          result.match(
            (it) => throw it,
            (it) => expect(it, user),
          );
        },
      );

      test(
        'Should return fatal error detail when getting current user fails',
        () async {
          when(() => mockGetUserRemoteSourceAction.execute()).thenAnswer((_) async => left(const ErrorDetail.fatal()));

          final result = await getUserUsecase.execute();

          result.match(
            (it) => expect(it, GetUserFailure.fatal),
            (it) => throw it,
          );
        },
      );
    },
  );
}
