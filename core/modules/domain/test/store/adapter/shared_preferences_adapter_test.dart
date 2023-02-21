import 'package:domain/store/adapter/shared_preferences_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group(
    'SharedPreferencesAdapter',
    () {
      late MockSharedPreferences mockSharedPreferences;
      late SharedPreferencesAdapter mockSharedPreferencesAdapter;

      const storeKey = 'key';
      const storeValue = 'value';

      setUpAll(() {
        mockSharedPreferences = MockSharedPreferences();
        mockSharedPreferencesAdapter = SharedPreferencesAdapter(
          sharedPreferences: mockSharedPreferences,
        );
      });

      group(
        'delete',
        () {
          test(
            'Should call .delete and return nothing if everything goes ok',
            () {
              when(() => mockSharedPreferences.remove(storeKey)).thenAnswer((_) async => true);

              final result = mockSharedPreferencesAdapter.delete(key: storeKey);

              expect(result, isA<Future<void>>());
              verify(() => mockSharedPreferences.remove(storeKey)).called(1);
            },
          );
        },
      );

      group(
        'read',
        () {
          test(
            'Should call .read with given key and return value if everything goes ok',
            () async {
              when(() => mockSharedPreferences.getString(storeKey)).thenReturn(storeValue);

              final result = await mockSharedPreferencesAdapter.read(key: storeKey);

              expect(result, storeValue);
              verify(() => mockSharedPreferences.getString(storeKey)).called(1);
            },
          );

          test(
            'Should call .read and return null if something goes wrong '
            'there is no value under given key',
            () async {
              when(() => mockSharedPreferences.getString(storeKey)).thenReturn(null);

              final result = await mockSharedPreferencesAdapter.read(key: storeKey);

              expect(result, null);
              verify(() => mockSharedPreferences.getString(storeKey)).called(1);
            },
          );
        },
      );

      group(
        'write',
        () {
          test(
            'Should call .write with given key and return nothing if everything goes ok',
            () {
              when(() => mockSharedPreferences.setString(storeKey, storeValue)).thenAnswer((_) async => true);

              final result = mockSharedPreferencesAdapter.write(key: storeKey, value: storeValue);

              expect(result, isA<Future<void>>());
              verify(() => mockSharedPreferences.setString(storeKey, storeValue)).called(1);
            },
          );
        },
      );
    },
  );
}
