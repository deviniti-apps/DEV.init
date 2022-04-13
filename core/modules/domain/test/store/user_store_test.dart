import 'package:domain/model/user.dart';
import 'package:domain/preference_assistant/preference_assistant.dart';
import 'package:domain/store/user_store.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockPreferenceAssistant extends Mock implements PreferenceAssistant {}

void main() {
  group(
    'UserStore',
    () {
      late MockPreferenceAssistant mockPreferenceAssistant;
      late UserStore userStore;

      setUp(
        () {
          mockPreferenceAssistant = MockPreferenceAssistant();
          userStore = UserStore(
            preferences: mockPreferenceAssistant,
          );
        },
      );

      test(
        'Should clear user store when there is no error',
        () async {
          when(() => mockPreferenceAssistant.deleteAll()).thenAnswer((invocation) async => true);

          final result = await userStore.clear();

          expect(result, true);
        },
      );

      test(
        'Should get user when there is no error',
        () async {
          const userJson = '{"name":"Adam","email":"adam.kowalski@example.com"}';

          const user = User(
            name: 'Adam',
            email: 'adam.kowalski@example.com',
          );

          when(() => mockPreferenceAssistant.read<String>(key: '4e49e858-3b76-41a1-9101-7b46c709eb88'))
              .thenReturn(userJson);

          final result = await userStore.getUser();

          expect(result, user);
        },
      );

      test(
        'Should put user when there is no error',
        () {
          const userJson = '{"name":"Adam","email":"adam.kowalski@example.com"}';

          const user = User(
            name: 'Adam',
            email: 'adam.kowalski@example.com',
          );

          when(() => mockPreferenceAssistant.write<String>(
                key: '4e49e858-3b76-41a1-9101-7b46c709eb88',
                value: userJson,
              )).thenAnswer((_) async => true);

          final result = userStore.putUserData(value: user);

          expect(result, equals(isA<Future<void>>()));
        },
      );
    },
  );
}
