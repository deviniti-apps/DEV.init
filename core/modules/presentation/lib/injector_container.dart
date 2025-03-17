// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:domain/domain_injector.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/components/auth/bloc/auth_bloc.dart';
import 'package:presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:presentation/screens/dashboard/dashboard_argument.dart';
import 'package:presentation/screens/dashboard_home/bloc/dashboard_home_bloc.dart';
import 'package:presentation/screens/dashboard_home/dashboard_home_argument.dart';
import 'package:presentation/screens/dashboard_profile/bloc/dashboard_profile_bloc.dart';
import 'package:presentation/screens/dashboard_profile/dashboard_profile_argument.dart';
import 'package:presentation/screens/welcome/bloc/welcome_bloc.dart';
import 'package:presentation/screens/welcome/welcome_argument.dart';
import 'package:remote/remote_injector.dart';

final injector = GetIt.instance;

Future<void> init({
  required String apiUrl,
}) async {
  await injector.registerDomain();

  injector
    ..registerRemote(baseUrl: apiUrl)
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        userProvider: injector.get(),
      ),
    )
    ..registerFactoryParam<WelcomeBloc, WelcomeArgument, void>(
      (argument, _) => WelcomeBloc(
        argument: argument,
        userProvider: injector.get(),
      ),
    )
    ..registerFactoryParam<DashboardBloc, DashboardArgument, void>(
      (argument, _) => DashboardBloc(
        argument: argument,
      ),
    )
    ..registerFactoryParam<DashboardHomeBloc, DashboardHomeArgument, void>(
      (argument, _) => DashboardHomeBloc(
        argument: argument,
      ),
    )
    ..registerFactoryParam<DashboardProfileBloc, DashboardProfileArgument, void>(
      (argument, _) => DashboardProfileBloc(
        argument: argument,
      ),
    );
}
