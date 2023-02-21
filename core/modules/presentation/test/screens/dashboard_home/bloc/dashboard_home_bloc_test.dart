import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/screens/dashboard_home/bloc/dashboard_home_bloc.dart';
import 'package:presentation/screens/dashboard_home/dashboard_home_argument.dart';

void main() {
  late DashboardHomeBloc bloc;

  const argument = DashboardHomeArgument();

  setUp(
    () {
      bloc = DashboardHomeBloc(argument: argument);
    },
  );

  blocTest<DashboardHomeBloc, DashboardHomeState>(
    'on DashboardHomeEvent.onInitiated emits nothing',
    build: () => bloc,
    act: (bloc) => bloc.add(const DashboardHomeEvent.onInitiated()),
    expect: () => [],
  );
}
