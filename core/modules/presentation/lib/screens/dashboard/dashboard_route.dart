import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/injector_container.dart';
import 'package:presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:presentation/screens/dashboard/dashboard_argument.dart';
import 'package:presentation/screens/dashboard/dashboard_screen.dart';

Route<dynamic> dashboardRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(
          create: (context) => injector<DashboardBloc>(
            param1: settings.arguments ?? const DashboardArgument(),
          )..add(const DashboardEvent.started()),
        ),
      ],
      child: DashboardScreen(),
    ),
  );
}
