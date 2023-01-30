import 'package:domain/store/adapter/storage_adapter.dart';
import 'package:domain/store/single_value_store.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'storable_model.dart';

class MockAdapter extends Mock implements StorageAdapter {}

void main() {
  group(
    'SingleValueStore',
    () {
      const key = 'StoreKey';

      late MockAdapter mockAdapter;

      setUp(() => mockAdapter = MockAdapter());

      const storableModel = StorableModel(id: 1);

      group(
        'write()',
        () {
          test(
            'should write value to the store',
            () async {
              final store = SingleValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.write(key: key, value: any(named: 'value'))).thenAnswer((_) async {});

              await store.write(value: storableModel);

              verify(() => mockAdapter.write(key: key, value: '{"id":1}')).called(1);
            },
          );
        },
      );

      group(
        'read()',
        () {
          test(
            'should return null when store returns a null string',
            () async {
              final store = SingleValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => null);

              final result = await store.read();

              expect(result, null);

              verify(() => mockAdapter.read(key: key)).called(1);
            },
          );

          test(
            'should not clear invalid data and return null when configured so',
            () async {
              final store = SingleValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
                removeWhenInvalid: false,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '!#%%^#!');

              final result = await store.read();

              expect(result, null);

              verifyNever(() => mockAdapter.delete(key: key));
            },
          );

          test(
            'should clear invalid data from the store and return null by default',
            () async {
              final store = SingleValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '!#%%^#!');
              when(() => mockAdapter.delete(key: key)).thenAnswer((_) async {});

              await store.read();

              verify(() => mockAdapter.delete(key: key)).called(1);
            },
          );

          test(
            'should read value from the store',
            () async {
              final store = SingleValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '{"id":1}');

              final result = await store.read();

              expect(result, storableModel);
            },
          );
        },
      );

      group(
        'delete()',
        () {
          test(
            'should delete value from the store',
            () async {
              final store = SingleValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.delete(key: key)).thenAnswer((_) async {});

              await store.delete();

              verify(() => mockAdapter.delete(key: key)).called(1);
            },
          );
        },
      );
    },
  );
}
