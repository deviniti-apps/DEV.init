import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/application/app.dart';
import 'package:presentation/components/auth/auth_navigation_hub.dart';
import 'package:presentation/components/auth/bloc/auth_bloc.dart';
import 'package:presentation/components/snack_bar/bloc/snack_bar_bloc.dart';
import 'package:presentation/components/snack_bar/snack_bar_container_widget.dart';
import 'package:presentation/injector_container.dart';
import 'package:presentation/l10n/translations.dart';
import 'package:presentation/router/app_route_factory.dart';

class Application extends StatelessWidget {
  Application({
    required this.appTheme,
    required this.appRouteFactory,
  });

  final AppTheme appTheme;
  final AppRouteFactory appRouteFactory;

  final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
  late final _routerConfig = appRouteFactory.router(
    rootNavigatorKey: _rootNavigatorKey,
    shellNavigatorKey: _shellNavigatorKey,
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injector<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => SnackBarBloc(),
        )
      ],
      child: AdaptiveTheme(
        light: appTheme.theme(LightPalette()),
        dark: appTheme.theme(DarkPalette()),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => MaterialApp.router(
          localizationsDelegates: Translations.localizationsDelegates,
          supportedLocales: Translations.supportedLocales,
          theme: theme,
          darkTheme: darkTheme,
          routerConfig: _routerConfig,
          builder: (context, child) => AuthNavigationHub(
            rootNavigatorKey: _rootNavigatorKey,
            child: SnackBarContainer(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
