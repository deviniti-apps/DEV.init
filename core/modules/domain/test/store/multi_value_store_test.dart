import 'package:domain/store/adapter/storage_adapter.dart';
import 'package:domain/store/multi_value_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'storable_model.dart';

class MockAdapter extends Mock implements StorageAdapter {}

void main() {
  group(
    'MultiValueStore',
    () {
      const key = 'StoreKey';

      late MockAdapter mockAdapter;

      setUp(() => mockAdapter = MockAdapter());

      const storableModel = StorableModel(id: 1);

      group(
        'add()',
        () {
          test(
            'should skip saving a duplicate by default and return false',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '[{"id":1}]');

              final result = await store.add(value: storableModel);

              expect(result, false);
            },
          );

          test(
            'should save a duplicate when store is configured to do so and return true',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
                allowDuplicates: true,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '[{"id":1}]');
              when(() => mockAdapter.write(key: key, value: any(named: 'value'))).thenAnswer((_) async {});

              final result = await store.add(value: storableModel);

              expect(result, true);

              verify(() => mockAdapter.write(key: key, value: '[{"id":1},{"id":1}]')).called(1);
            },
          );

          test(
            'should append value and return true',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '[{"id":2}]');
              when(() => mockAdapter.write(key: key, value: any(named: 'value'))).thenAnswer((_) async {});

              final result = await store.add(value: storableModel);

              expect(result, true);

              verify(() => mockAdapter.write(key: key, value: '[{"id":2},{"id":1}]')).called(1);
            },
          );

          test(
            'should prepend value and return true',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '[{"id":2}]');
              when(() => mockAdapter.write(key: key, value: any(named: 'value'))).thenAnswer((_) async {});

              final result = await store.add(value: storableModel, prepend: true);

              expect(result, true);

              verify(() => mockAdapter.write(key: key, value: '[{"id":1},{"id":2}]')).called(1);
            },
          );
        },
      );

      group(
        'addAll()',
        () {
          test(
            'should skip saving if iterable contains only duplicates by default and return false',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '[{"id":1},{"id":2}]');

              final result = await store.addAll(values: [storableModel, storableModel.copyWith(id: 2)]);

              expect(result, false);
            },
          );

          test(
            'should append only non-duplicated values by default and return true',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '[{"id":1}]');
              when(() => mockAdapter.write(key: key, value: any(named: 'value'))).thenAnswer((_) async {});

              final result = await store.addAll(values: [storableModel, storableModel.copyWith(id: 2)]);

              expect(result, true);

              verify(() => mockAdapter.write(key: key, value: '[{"id":1},{"id":2}]')).called(1);
            },
          );

          test(
            'should prepend only non-duplicated values by default and return true',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '[{"id":1}]');
              when(() => mockAdapter.write(key: key, value: any(named: 'value'))).thenAnswer((_) async {});

              final result = await store.addAll(values: [storableModel, storableModel.copyWith(id: 2)], prepend: true);

              expect(result, true);

              verify(() => mockAdapter.write(key: key, value: '[{"id":2},{"id":1}]')).called(1);
            },
          );

          test(
            'should append even duplicated values when store is configured to do so and return true',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
                allowDuplicates: true,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '[{"id":1}]');
              when(() => mockAdapter.write(key: key, value: any(named: 'value'))).thenAnswer((_) async {});

              final result = await store.addAll(values: [storableModel, storableModel.copyWith(id: 2)]);

              expect(result, true);

              verify(() => mockAdapter.write(key: key, value: '[{"id":1},{"id":1},{"id":2}]')).called(1);
            },
          );

          test(
            'should prepend even duplicated values when store is configured to do so and return true',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
                allowDuplicates: true,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '[{"id":1}]');
              when(() => mockAdapter.write(key: key, value: any(named: 'value'))).thenAnswer((_) async {});

              final result = await store.addAll(values: [storableModel, storableModel.copyWith(id: 2)], prepend: true);

              expect(result, true);

              verify(() => mockAdapter.write(key: key, value: '[{"id":1},{"id":2},{"id":1}]')).called(1);
            },
          );
        },
      );

      group(
        'getAll()',
        () {
          test(
            'should return an empty list when adapter returns null',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => null);

              final result = await store.getAll();

              expect(result, []);
            },
          );

          test(
            'should return an empty list when adapter returns an empty string',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '');

              final result = await store.getAll();

              expect(result, []);
            },
          );

          test(
            'should return an empty list and clear corrupted data upon read by default',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '#%@^!%&#');
              when(() => mockAdapter.delete(key: key)).thenAnswer((_) async {});

              final result = await store.getAll();

              expect(result, []);

              verify(() => mockAdapter.delete(key: key)).called(1);
            },
          );

          test(
            'should return an empty list and not clear corrupted data when store is configured not to do so',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
                clearOnCorruptedRead: false,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '#%@^!%&#');

              final result = await store.getAll();

              expect(result, []);

              verifyNever(() => mockAdapter.delete(key: key));
            },
          );

          test(
            'should return stored data in order',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
                clearOnCorruptedRead: false,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '[{"id":1},{"id":2}]');

              final result = await store.getAll();

              expect(result, [storableModel, storableModel.copyWith(id: 2)]);
            },
          );
        },
      );

      group(
        'remove()',
        () {
          test(
            'should return false when the value is not present in the store',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '[{"id":2}]');

              final result = await store.remove(value: storableModel);

              expect(result, false);
            },
          );

          test(
            'should return true when the value was removed',
            () async {
              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '[{"id":1},{"id":2}]');
              when(() => mockAdapter.write(key: key, value: any(named: 'value'))).thenAnswer((_) async {});

              final result = await store.remove(value: storableModel);

              expect(result, true);

              verify(() => mockAdapter.write(key: key, value: '[{"id":2}]')).called(1);
            },
          );
        },
      );

      group(
        'removeAll()',
        () {
          test(
            'should remove all values from the adapter',
            () async {
              when(() => mockAdapter.delete(key: any(named: 'key'))).thenAnswer((_) async {});

              final store = MultiValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              await store.removeAll();

              verify(() => mockAdapter.delete(key: key)).called(1);
            },
          );
        },
      );
    },
  );
}
