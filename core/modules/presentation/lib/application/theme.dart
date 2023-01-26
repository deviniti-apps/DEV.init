// ignore_for_file: overridden_fields
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Palette {
  late Brightness brightness;
  late Color darkGrayColor;
  late Color shadowColor;
  late Color inactiveColor;
  late Color snackBarColor;
  late Color cardColor;
  late Color primaryColor;
  late Color primaryDarkColor;
  late Color primaryLightColor;
  late Color accentColor;
  late Color accentVariantColor;
  late Color errorColor;
  late Color iconColor;
  late Color backgroundColor;
  late Color appBarBackgroundColor;
  late Color textOnPrimaryColor;
  late Color primaryTextDisplayColor;
  late Color primaryTextBodyColor;
  late Color badgeColor1;
  late Color badgeColor2;
  late Color badgeColor3;
  late Color badgeColor4;
}

class LightPalette extends Palette {
  @override
  final Brightness brightness = Brightness.light;
  @override
  final Color shadowColor = const Color(0x1A3C640D);
  @override
  final Color darkGrayColor = const Color(0xff4D4D4F);
  @override
  final Color inactiveColor = const Color(0xffA1A3A6);
  @override
  final Color snackBarColor = const Color(0xb3000000);
  @override
  final Color cardColor = const Color(0xffffffff);
  @override
  final Color primaryColor = const Color(0xff1A3C64);
  @override
  final Color primaryDarkColor = const Color(0xff112C4B);
  @override
  final Color primaryLightColor = const Color(0xff486383);
  @override
  final Color accentColor = const Color(0xff1FA0B0);
  @override
  final Color accentVariantColor = const Color(0xff84B340);
  @override
  final Color errorColor = const Color(0xffEB4B48);
  @override
  final Color iconColor = const Color(0xff163567);
  @override
  final Color backgroundColor = const Color(0xffF8F9F9);
  @override
  final Color textOnPrimaryColor = Colors.white;
  @override
  final Color primaryTextBodyColor = const Color(0xff173047);
  @override
  final Color primaryTextDisplayColor = const Color(0xff173047);
  @override
  final Color appBarBackgroundColor = const Color(0xffF8F9F9);
  @override
  final Color badgeColor1 = const Color(0xff1FA0B0);
  @override
  final Color badgeColor2 = const Color(0xff0022AA);
  @override
  final Color badgeColor3 = const Color(0xff84B340);
  @override
  final Color badgeColor4 = const Color(0xff5D1B97);
}

class DarkPalette extends Palette {
  @override
  final Brightness brightness = Brightness.dark;
  @override
  final Color darkGrayColor = const Color(0xff4D4D4F);
  @override
  final Color shadowColor = const Color(0x1A3C640D);
  @override
  final Color inactiveColor = const Color(0xffA1A3A6);
  @override
  final Color snackBarColor = const Color(0xb3ffffff);
  @override
  final Color cardColor = const Color(0xffffffff);
  @override
  final Color primaryColor = const Color(0xff1A3C64);
  @override
  final Color primaryDarkColor = const Color(0xff112C4B);
  @override
  final Color primaryLightColor = const Color(0xff486383);
  @override
  final Color accentColor = const Color(0xff1FA0B0);
  @override
  final Color accentVariantColor = const Color(0xff84B340);
  @override
  final Color errorColor = const Color(0xffEB4B48);
  @override
  final Color iconColor = const Color(0xff163567);
  @override
  final Color backgroundColor = const Color(0xffF8F9F9);
  @override
  final Color textOnPrimaryColor = Colors.white;
  @override
  final Color primaryTextBodyColor = const Color(0xff1A3C64);
  @override
  final Color primaryTextDisplayColor = const Color(0xff1A3C64);
  @override
  final Color appBarBackgroundColor = const Color(0xffF8F9F9);
  @override
  final Color badgeColor1 = const Color(0xff1FA0B0);
  @override
  final Color badgeColor2 = const Color(0xff0022AA);
  @override
  final Color badgeColor3 = const Color(0xff84B340);
  @override
  final Color badgeColor4 = const Color(0xff5D1B97);
}

class AppTheme {
  static Palette paletteOf(BuildContext context) {
    return context.theme.brightness == Brightness.light ? LightPalette() : DarkPalette();
  }

  ThemeData theme(Palette palette) {
    final theme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: generateMaterialColor(palette.primaryColor),
        primaryColorDark: palette.primaryDarkColor,
        accentColor: palette.accentColor,
        cardColor: palette.cardColor,
        backgroundColor: palette.backgroundColor,
        brightness: palette.brightness,
      ).copyWith(
        secondaryContainer: palette.accentVariantColor,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryTextTheme: _textThemeHandset.apply(
        bodyColor: palette.primaryTextBodyColor,
        displayColor: palette.primaryTextDisplayColor,
      ),
      textTheme: _textThemeHandset.apply(
        bodyColor: palette.primaryTextBodyColor,
        displayColor: palette.primaryTextDisplayColor,
      ),
      iconTheme: IconThemeData(color: palette.iconColor),
      canvasColor: palette.backgroundColor,
      scaffoldBackgroundColor: palette.backgroundColor,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: palette.brightness,
          statusBarIconBrightness: palette.brightness,
          systemNavigationBarIconBrightness: palette.brightness,
        ),
        toolbarTextStyle: TextStyle(color: palette.primaryColor),
        titleTextStyle: TextStyle(color: palette.primaryColor, fontWeight: FontWeight.bold, fontSize: 16),
        color: palette.appBarBackgroundColor,
        iconTheme: IconThemeData(color: palette.iconColor),
        actionsIconTheme: IconThemeData(color: palette.iconColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: palette.accentVariantColor),
        unselectedIconTheme: IconThemeData(color: palette.primaryColor),
        selectedItemColor: palette.accentVariantColor,
        unselectedItemColor: palette.primaryColor,
        selectedLabelStyle: TextStyle(color: palette.accentVariantColor),
        unselectedLabelStyle: TextStyle(color: palette.primaryColor),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
    return theme.copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: palette.accentVariantColor),
      ),
    );
  }

  TextTheme get _textThemeHandset => TextTheme(
        displayLarge: GoogleFonts.lato(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.48,
        ),
        displayMedium: GoogleFonts.lato(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.48,
        ),
        displaySmall: GoogleFonts.lato(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.48,
        ),
        headlineSmall: GoogleFonts.lato(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.408,
        ),
        titleLarge: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.078,
        ),
        titleMedium: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.19,
        ),
        titleSmall: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.64,
        ),
        bodyLarge: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.32,
        ),
        bodyMedium: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.32,
        ),
        labelLarge: GoogleFonts.lato(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.32,
        ),
        bodySmall: GoogleFonts.lato(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.32,
        ),
        labelSmall: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.64,
        ),
      );

  MaterialColor generateMaterialColor(Color color) => MaterialColor(color.value, {
        50: tintColor(color, 0.9),
        100: tintColor(color, 0.8),
        200: tintColor(color, 0.6),
        300: tintColor(color, 0.4),
        400: tintColor(color, 0.2),
        500: color,
        600: shadeColor(color, 0.1),
        700: shadeColor(color, 0.2),
        800: shadeColor(color, 0.3),
        900: shadeColor(color, 0.4),
      });

  int tintValue(int value, double factor) => max(
        0,
        min((value + ((255 - value) * factor)).round(), 255),
      );

  Color tintColor(Color color, double factor) => Color.fromRGBO(
        tintValue(color.red, factor),
        tintValue(color.green, factor),
        tintValue(color.blue, factor),
        1,
      );

  int shadeValue(int value, double factor) => max(
        0,
        min(value - (value * factor).round(), 255),
      );

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
        shadeValue(color.red, factor),
        shadeValue(color.green, factor),
        shadeValue(color.blue, factor),
        1,
      );
}

extension AppThemes on BuildContext {
  ThemeData get theme => Theme.of(this);

  AppBarTheme get appBarThemes => theme.appBarTheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Palette get palette => AppTheme.paletteOf(this);

  ColorScheme get colors => theme.colorScheme;
}
