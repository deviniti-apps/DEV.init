import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foundation/foundation.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logInfo('${_baseType(bloc)}: Created ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logInfo('${_baseType(bloc)}: Closed ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logSevere('${_baseType(bloc)}: Error in ${bloc.runtimeType}: $error');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logInfo('${_baseType(bloc)}: Transition in ${bloc.runtimeType}: $transition');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logInfo('${_baseType(bloc)}: Change in ${bloc.runtimeType}: $change');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logInfo('${_baseType(bloc)}: Event in ${bloc.runtimeType}: $event');
  }

  String _baseType(BlocBase blocBase) {
    return (blocBase is Bloc) ? 'bloc' : 'cubit';
  }
}
