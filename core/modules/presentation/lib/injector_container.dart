// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:domain/domain_injector.dart';
import 'package:domain/model/pageable.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/components/auth/bloc/auth_bloc.dart';
import 'package:presentation/components/pagination/pagination.dart';
import 'package:presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:presentation/screens/dashboard/dashboard_argument.dart';
import 'package:remote/remote_injector.dart';

final injector = GetIt.instance;

Future<void> init() async {
  await injector.registerDomain();

  injector
    ..registerRemote(baseUrl: 'https://jsonplaceholder.typicode.com')
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        unAuthStreamProvider: injector.get(),
      ),
    )
    ..registerFactoryParam<DashboardBloc, DashboardArgument, void>(
      (argument, _) => DashboardBloc(
        argument: argument,
        getUserUsecase: injector.get(),
      ),
    );
}

extension GetItPagination on GetIt {
  String get paginationManagerPostFix => '_pagination_manager';

  String get paginationBlocPostFix => '_pagination_bloc';

  PaginationBloc<T> getPaginationBloc<T extends Pageable>({
    required String instanceNamePrefix,
  }) {
    return get(instanceName: '$instanceNamePrefix$paginationBlocPostFix');
  }

  void registerPagination<T extends Pageable>({
    required String instanceNamePrefix,
    required PaginationManager<T> Function() paginationManagerFactory,
  }) {
    this
      ..registerFactory<PaginationBloc<T>>(
        () => PaginationBloc<T>(
          paginationManager: get(instanceName: '$instanceNamePrefix$paginationManagerPostFix'),
        ),
        instanceName: '$instanceNamePrefix$paginationBlocPostFix',
      )
      ..registerFactory<PaginationManager<T>>(
        () => paginationManagerFactory(),
        instanceName: '$instanceNamePrefix$paginationManagerPostFix',
      );
  }
}
