import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/application/app.dart';
import 'package:presentation/common/state_type.dart';
import 'package:presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:presentation/widgets/empty_page_widget.dart';
import 'package:presentation/widgets/error_page_widget.dart';
import 'package:presentation/widgets/loading_page_widget.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SafeArea(
        top: false,
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) => state.type.map(
            loading: () => const LoadingPage(),
            loaded: () => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Insets.medium,
                horizontal: Insets.large,
              ),
              child: Column(
                children: [
                  Text(state.user?.name ?? ''),
                  Text(state.user?.email ?? ''),
                ],
              ),
            ),
            empty: () => const EmptyPage(),
            error: () => const ErrorPage(),
          ),
        ),
      ),
    );
  }
}
