import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/injector_container.dart';
import 'package:presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:presentation/screens/dashboard/dashboard_screen.dart';

Route<dynamic> dashboardRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(
          create: (context) => injector<DashboardBloc>()..add(const DashboardEvent.initiated()),
        ),
      ],
      child: DashboardScreen(),
    ),
  );
}
