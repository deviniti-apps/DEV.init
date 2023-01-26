import 'package:domain/preference_assistant/preference_assistant.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group(
    'PreferenceAssistant',
    () {
      late MockSharedPreferences mockSharedPreferences;
      late PreferenceAssistant preferenceAssistant;

      setUp(
        () {
          mockSharedPreferences = MockSharedPreferences();
          preferenceAssistant = PreferenceAssistant(
            sharedPreferences: mockSharedPreferences,
          );
        },
      );

      test(
        'Deletes all',
        () async {
          when(() => mockSharedPreferences.clear()).thenAnswer((_) async => true);

          final result = await preferenceAssistant.deleteAll();

          expect(result, true);
        },
      );

      test(
        'Deletes key',
        () async {
          when(() => mockSharedPreferences.remove('key')).thenAnswer((_) async => true);

          final result = await preferenceAssistant.remove(key: 'key');

          expect(result, true);
        },
      );

      test(
        'Writes string value',
        () async {
          when(() => mockSharedPreferences.setString('key', 'value')).thenAnswer((_) async => true);

          final result = await preferenceAssistant.write<String>(key: 'key', value: 'value');

          expect(result, true);
        },
      );

      test(
        'Writes bool value',
        () async {
          when(() => mockSharedPreferences.setBool('key', true)).thenAnswer((_) async => true);

          final result = await preferenceAssistant.write<bool>(key: 'key', value: true);

          expect(result, true);
        },
      );

      test(
        'Reads string value',
        () {
          when(() => mockSharedPreferences.getString('key')).thenReturn('value');

          final result = preferenceAssistant.read<String>(key: 'key');

          expect(result, 'value');
        },
      );

      test(
        'Reads bool value',
        () {
          when(() => mockSharedPreferences.getBool('key')).thenReturn(true);

          final result = preferenceAssistant.read<bool>(key: 'key');

          expect(result, true);
        },
      );
    },
  );
}
