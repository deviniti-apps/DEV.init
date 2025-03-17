import 'package:domain/store/adapter/storage_adapter.dart';
import 'package:domain/store/single_value_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

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
            'should write value to the store and return unit when there is no error',
            () async {
              final store = SingleValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.write(key: key, value: any(named: 'value'))).thenAnswer((_) async {});

              final result = await store.write(value: storableModel).run();

              expect(result, const Right<SingleValueStoreFailure, Unit>(unit));

              verify(() => mockAdapter.write(key: key, value: '{"id":1}')).called(1);
            },
          );

          test(
            'should write value to the store and return SingleValueStoreFailure.fatal when there is an error',
            () async {
              final store = SingleValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.write(key: key, value: any(named: 'value'))).thenThrow((_) => Object());

              final result = await store.write(value: storableModel).run();

              expect(result, const Left<SingleValueStoreFailure, Unit>(SingleValueStoreFailure.fatal));

              verify(() => mockAdapter.write(key: key, value: '{"id":1}')).called(1);
            },
          );
        },
      );

      group(
        'read()',
        () {
          test(
            'should return null when store returns SingleValueStoreFailure.notFound',
            () async {
              final store = SingleValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => null);

              final result = await store.read().run();

              expect(result, const Left<SingleValueStoreFailure, StorableModel>(SingleValueStoreFailure.notFound));

              verify(() => mockAdapter.read(key: key)).called(1);
            },
          );

          test(
            'should not clear invalid data and return SingleValueStoreFailure.fatal when configured so',
            () async {
              final store = SingleValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
                removeWhenInvalid: false,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '!#%%^#!');

              final result = await store.read().run();

              expect(result, const Left<SingleValueStoreFailure, StorableModel>(SingleValueStoreFailure.fatal));

              verifyNever(() => mockAdapter.delete(key: key));
            },
          );

          test(
            'should clear invalid data from the store and return SingleValueStoreFailure.fatal by default',
            () async {
              final store = SingleValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.read(key: key)).thenAnswer((_) async => '!#%%^#!');
              when(() => mockAdapter.delete(key: key)).thenAnswer((_) async {});

              final result = await store.read().run();

              expect(result, const Left<SingleValueStoreFailure, StorableModel>(SingleValueStoreFailure.fatal));

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

              final result = await store.read().run();

              expect(result, const Right<SingleValueStoreFailure, StorableModel>(storableModel));
            },
          );
        },
      );

      group(
        'delete()',
        () {
          test(
            'should delete value from the store and return unit when there is no error',
            () async {
              final store = SingleValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.delete(key: key)).thenAnswer((_) async {});

              final result = await store.delete().run();

              expect(result, const Right<SingleValueStoreFailure, Unit>(unit));

              verify(() => mockAdapter.delete(key: key)).called(1);
            },
          );

          test(
            'should delete value from the store and return SingleValueStoreFailure.fatal when there is an error',
            () async {
              final store = SingleValueStore(
                adapter: mockAdapter,
                key: key,
                fromJson: StorableModel.fromJson,
              );

              when(() => mockAdapter.delete(key: key)).thenThrow((_) => Object());

              final result = await store.delete().run();

              expect(result, const Left<SingleValueStoreFailure, Unit>(SingleValueStoreFailure.fatal));

              verify(() => mockAdapter.delete(key: key)).called(1);
            },
          );
        },
      );
    },
  );
}
