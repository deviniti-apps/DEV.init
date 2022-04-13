import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foundation/foundation.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logInfo('bloc: $bloc');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logInfo('bloc: $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logSevere('bloc: ${bloc.runtimeType}', error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logInfo('$bloc: ${bloc.runtimeType}, $transition');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logInfo('cubit: ${bloc.runtimeType}, $change');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logInfo('bloc: ${bloc.runtimeType}, $event');
  }
}
