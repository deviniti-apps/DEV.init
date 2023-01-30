// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:domain/auth_token_provider.dart';
import 'package:domain/model/user.dart';
import 'package:domain/store/adapter/secure_storage_adapter.dart';
import 'package:domain/store/adapter/shared_preferences_adapter.dart';
import 'package:domain/store/single_value_store.dart';
import 'package:domain/usecase/get_user_usecase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension DomainInjector on GetIt {
  Future<void> registerDomain() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    this
      .._registerUseCases()
      ..registerLazySingleton<SharedPreferencesAdapter>(
        () => SharedPreferencesAdapter(sharedPreferences: sharedPreferences),
      )
      ..registerLazySingleton<SecureStorageAdapter>(
        () => const SecureStorageAdapter(flutterSecureStorage: FlutterSecureStorage()),
      )
      ..registerLazySingleton<SingleValueStore<User>>(
        () => SingleValueStore<User>(
          adapter: get<SharedPreferencesAdapter>(),
          key: User.loggedInUserStoreKey,
          fromJson: User.fromJson,
        ),
      )
      ..registerLazySingleton<AuthTokenProvider>(
        () => AuthTokenProviderImpl(
          userStore: get(),
        ),
      );
  }

  void _registerUseCases() {
    this
      ..registerFactory<GetUserUsecase>(
        () => GetUserUsecase(
          getUserRemoteSourceAction: get(),
        ),
      );
  }
}
