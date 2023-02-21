import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:presentation/screens/dashboard/dashboard_argument.dart';

void main() {
  late DashboardBloc bloc;

  const argument = DashboardArgument();

  setUp(
    () {
      bloc = DashboardBloc(argument: argument);
    },
  );

  blocTest<DashboardBloc, DashboardState>(
    'on DashboardEvent.onInitiated emits nothing',
    build: () => bloc,
    act: (bloc) => bloc.add(const DashboardEvent.onInitiated()),
    expect: () => [],
  );
}
