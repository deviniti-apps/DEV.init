library presentation;

import 'package:presentation/application/app_const.dart';
import 'package:presentation/application/application.dart';
import 'package:presentation/application/dot_env_variables.dart';
import 'package:presentation/application/theme.dart';
import 'package:presentation/router/app_route_factory.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:presentation/injector_container.dart' as di;
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;

Future<void> runApplication() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dot_env.load(fileName: AppConst.assetName);

  await di.init(dot_env.env[DotEnvVariables.url]!);
  await ThemeManager.initialise();

  runApp(
    Application(
      appTheme: AppTheme(),
      appRouteFactory: AppRouteFactory(),
    ),
  );
}
