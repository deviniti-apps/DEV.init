import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/screens/dashboard_profile/bloc/dashboard_profile_bloc.dart';
import 'package:presentation/screens/dashboard_profile/dashboard_profile_argument.dart';

void main() {
  late DashboardProfileBloc bloc;

  const argument = DashboardProfileArgument();

  setUp(
    () {
      bloc = DashboardProfileBloc(argument: argument);
    },
  );

  blocTest<DashboardProfileBloc, DashboardProfileState>(
    'on DashboardProfileEvent.onInitiated emits nothing',
    build: () => bloc,
    act: (bloc) => bloc.add(const DashboardProfileEvent.onInitiated()),
    expect: () => [],
  );
}
