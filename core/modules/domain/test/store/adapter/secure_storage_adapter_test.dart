import 'package:domain/store/adapter/secure_storage_adapter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  group(
    'SecureStorageAdapter',
    () {
      late MockFlutterSecureStorage mockFlutterSecureStorage;
      late SecureStorageAdapter mockFlutterSecureStorageAdapter;

      const storeKey = 'key';
      const storeValue = 'value';

      setUpAll(() {
        mockFlutterSecureStorage = MockFlutterSecureStorage();
        mockFlutterSecureStorageAdapter = SecureStorageAdapter(
          flutterSecureStorage: mockFlutterSecureStorage,
        );
      });

      group(
        'delete',
        () {
          test(
            'Should call .delete and return nothing if everything goes ok',
            () {
              when(() => mockFlutterSecureStorage.delete(key: storeKey)).thenAnswer((_) async => true);

              final result = mockFlutterSecureStorageAdapter.delete(key: storeKey);

              expect(result, isA<Future<void>>());
              verify(() => mockFlutterSecureStorage.delete(key: storeKey)).called(1);
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
              when(() => mockFlutterSecureStorage.read(key: storeKey)).thenAnswer((_) async => storeValue);

              final result = await mockFlutterSecureStorageAdapter.read(key: storeKey);

              expect(result, storeValue);
              verify(() => mockFlutterSecureStorage.read(key: storeKey)).called(1);
            },
          );

          test(
            'Should call .read and return null if something goes wrong '
            'there is no value under given key',
            () async {
              when(() => mockFlutterSecureStorage.read(key: storeKey)).thenAnswer((_) async => null);

              final result = await mockFlutterSecureStorageAdapter.read(key: storeKey);

              expect(result, null);
              verify(() => mockFlutterSecureStorage.read(key: storeKey)).called(1);
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
              when(() => mockFlutterSecureStorage.write(key: storeKey, value: storeValue))
                  .thenAnswer((_) async => true);

              final result = mockFlutterSecureStorageAdapter.write(key: storeKey, value: storeValue);

              expect(result, isA<Future<void>>());
              verify(() => mockFlutterSecureStorage.write(key: storeKey, value: storeValue)).called(1);
            },
          );
        },
      );
    },
  );
}
