import 'package:domain/auth_token_provider.dart';
import 'package:domain/preference_assistant/preference_assistant.dart';
import 'package:domain/service/authentication/authentication_service.dart';
import 'package:domain/service/user/user_service.dart';
import 'package:domain/store/user_store.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension DomainInjector on GetIt {
  Future<void> registerDomain() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    this
      ..registerFactory<SharedPreferences>(() => sharedPreferences)
      ..registerFactory<PreferenceAssistant>(
        () => PreferenceAssistant(sharedPreferences: get()),
      )
      ..registerFactory<UserStore>(
        () => UserStore(
          secureStorage: get(),
        ),
      )
      ..registerFactory<AuthenticationService>(
        () => AuthenticationServiceImpl(userStore: get()),
      )
      ..registerFactory<UserService>(
        () => UserServiceImpl(
          userRemoteDataSource: get(),
        ),
      )
      ..registerLazySingleton<AuthTokenProvider>(
        () => AuthTokenProviderImpl(
          userStore: get(),
        ),
      );
  }
}
