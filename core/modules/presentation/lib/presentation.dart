library presentation;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foundation/foundation.dart';
import 'package:presentation/application/application.dart';
import 'package:presentation/application/theme.dart';
import 'package:presentation/common/app_bloc_observer.dart';
import 'package:presentation/injector_container.dart' as di;
import 'package:presentation/router/app_route_factory.dart';

Future<void> runApplication() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  AppLogger.instance().configure(
    level: kDebugMode ? AppLogger.levelAll : AppLogger.levelSevere,
  );

  if (kDebugMode) {
    AppLogger.instance().enableConsoleOutput();
  }

  AppLogger.instance().output(
    (entry) {
      if (entry.error != null) {
        // for example log to firebase
      }
    },
  );

  runZonedGuarded(
    () {
      BlocOverrides.runZoned(
        () {
          runApp(
            Application(
              appTheme: AppTheme(),
              appRouteFactory: AppRouteFactory(),
            ),
          );
        },
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) {
      logSevere('runZonedGuarded', error, stackTrace);
    },
  );
}
