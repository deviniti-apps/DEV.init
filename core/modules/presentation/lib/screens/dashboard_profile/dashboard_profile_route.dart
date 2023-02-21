import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/injector_container.dart';
import 'package:presentation/screens/dashboard_profile/bloc/dashboard_profile_bloc.dart';
import 'package:presentation/screens/dashboard_profile/dashboard_profile_argument.dart';
import 'package:presentation/screens/dashboard_profile/dashboard_profile_screen.dart';

Widget dashboardProfileRoute(GoRouterState state) =>  MultiBlocProvider(
      providers: [
        BlocProvider<DashboardProfileBloc>(
          create: (context) => injector<DashboardProfileBloc>(
            param1: state.extra ?? const DashboardProfileArgument(),
          )..add(const DashboardProfileEvent.onInitiated()),
        ),
      ],
      child: DashboardProfileScreen(),
    );
  
