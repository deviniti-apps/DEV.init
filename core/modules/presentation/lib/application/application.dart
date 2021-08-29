import 'package:presentation/application/theme.dart';
import 'package:presentation/common/bloc/auth_bloc.dart';
import 'package:presentation/injector_container.dart';
import 'package:presentation/router/app_route_factory.dart';
import 'package:presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:presentation/l10n/translations.dart';

class Application extends StatelessWidget {
  const Application({
    @required this.appTheme,
    @required this.appRouteFactory,
    Key? key,
  }) : super(key: key);

  final AppTheme? appTheme;
  final AppRouteFactory? appRouteFactory;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>()..add(const AuthEvent.initiated()),
        ),
      ],
      child: ThemeBuilder(
        lightTheme: appTheme?.theme(LightPalette()),
        darkTheme: appTheme?.theme(DarkPalette()),
        builder: (context, regularTheme, darkTheme, themeMode) {
          return MaterialApp(
            onGenerateTitle: (context) => Translations.of(context)!.appTitle,
            localizationsDelegates: Translations.localizationsDelegates,
            supportedLocales: Translations.supportedLocales,
            theme: regularTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            onGenerateRoute: (settings) => appRouteFactory?.route(settings),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
