// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:domain/auth_token_provider.dart';
import 'package:domain/preference_assistant/preference_assistant.dart';
import 'package:domain/store/user_store.dart';
import 'package:domain/usecase/get_user_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension DomainInjector on GetIt {
  Future<void> registerDomain() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    this
      .._registerUseCases()
      ..registerFactory<SharedPreferences>(() => sharedPreferences)
      ..registerFactory<PreferenceAssistant>(
        () => PreferenceAssistant(sharedPreferences: get()),
      )
      ..registerFactory<UserStore>(
        () => UserStore(
          preferences: get(),
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
