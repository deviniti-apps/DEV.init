import 'package:presentation/common/bloc/auth_bloc.dart';
import 'package:domain/domain_injector.dart';
import 'package:remote/remote_injector.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init(String url) async {
  sl.registerRemote(baseUrl: url);
  await sl.registerDomain();

  sl.registerLazySingleton(
    () => AuthBloc(),
  );
}
