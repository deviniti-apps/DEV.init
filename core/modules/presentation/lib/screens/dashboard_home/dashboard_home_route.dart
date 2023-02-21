import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/injector_container.dart';
import 'package:presentation/screens/dashboard_home/bloc/dashboard_home_bloc.dart';
import 'package:presentation/screens/dashboard_home/dashboard_home_argument.dart';
import 'package:presentation/screens/dashboard_home/dashboard_home_screen.dart';

Widget dashboardHomeRoute(GoRouterState state) =>  MultiBlocProvider(
      providers: [
        BlocProvider<DashboardHomeBloc>(
          create: (context) => injector<DashboardHomeBloc>(
            param1: state.extra ?? const DashboardHomeArgument(),
          )..add(const DashboardHomeEvent.onInitiated()),
        ),
      ],
      child: DashboardHomeScreen(),
    );
  
