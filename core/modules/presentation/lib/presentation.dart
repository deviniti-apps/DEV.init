library presentation;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foundation/foundation.dart';
import 'package:presentation/application/app.dart';
import 'package:presentation/application/application.dart';
import 'package:presentation/common/app_bloc_observer.dart';
import 'package:presentation/environment/env.dart';
import 'package:presentation/injector_container.dart' as di;
import 'package:presentation/router/app_route_factory.dart';

Future<void> runApplication() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init(
    apiUrl: Env.apiUrl,
  );

  _runAppLogger();

  runZonedGuarded(
    () => runApp(
      Application(
        appTheme: AppTheme(),
        appRouteFactory: AppRouteFactory(),
      ),
    ),
    (error, stackTrace) => logSevere('Exception caught in presentation layer', error, stackTrace),
  );
}

void _runAppLogger() {
  Bloc.observer = AppBlocObserver();

  AppLogger.instance().configure(
    level: kDebugMode ? AppLogger.levelAll : AppLogger.levelSevere,
  );

  if (kDebugMode) {
    AppLogger.instance().enableConsoleOutput();
  }

  FlutterError.onError = (details) => logSevere(
        'FlutterError caught in app',
        details.exception,
        details.stack,
      );

  AppLogger.instance().output(
    (entry) {
      if (entry.error != null) {
        // for example log to firebase
      }
    },
  );
}
