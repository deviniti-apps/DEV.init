import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Palette {
  late Brightness brightness;
  late Color inactiveColor;
  late Color borderColor;
  late Color cardColor;
  late Color primaryColor;
  late Color primaryDarkColor;
  late Color accentColor;
  late Color errorColor;
  late Color iconColor;
  late Color scaffoldBackgroundColor;
  late Color appBarBackgroundColor;
  late Color textOnPrimaryColor;
  late Color textBodyColor;
  late Color textDisplayColor;
  late Color primaryTextDisplayColor;
  late Color primaryTextBodyColor;
}

class LightPalette extends Palette {
  @override
  final Brightness brightness = Brightness.light;
  @override
  final Color inactiveColor = Colors.grey[100]!;
  @override
  final Color borderColor = Colors.grey[400]!;
  @override
  final Color cardColor = const Color(0xffffffff);
  @override
  final Color primaryColor = const Color(0xff49B374);
  @override
  final Color primaryDarkColor = const Color(0xff199049);
  @override
  final Color accentColor = const Color(0xff49B374);
  @override
  final Color errorColor = const Color(0xffECA090);
  @override
  final Color iconColor = const Color(0xff173047).withOpacity(0.6);
  @override
  final Color scaffoldBackgroundColor = const Color(0xffffffff);
  @override
  final Color textOnPrimaryColor = Colors.white70;
  @override
  final Color textBodyColor = const Color(0xff173047);
  @override
  final Color textDisplayColor = Colors.grey[400]!;
  @override
  final Color primaryTextBodyColor = const Color(0xff173047);
  @override
  final Color primaryTextDisplayColor = const Color(0xff173047);
  @override
  final Color appBarBackgroundColor = Colors.grey.shade50;
}

// todo: correct it
class DarkPalette extends Palette {
  @override
  final Brightness brightness = Brightness.dark;
  @override
  final Color inactiveColor = const Color(0xff191B26);
  @override
  final Color borderColor = const Color(0xff191B26);
  @override
  final Color cardColor = const Color(0xff282938);
  @override
  final Color primaryColor = const Color(0xff49B374);
  @override
  final Color primaryDarkColor = const Color(0xff199049);
  @override
  final Color accentColor = const Color(0xff49B374);
  @override
  final Color errorColor = const Color(0xffECA090);
  @override
  final Color iconColor = const Color(0xff87a67d);
  @override
  final Color scaffoldBackgroundColor = const Color(0xff191B26);
  @override
  final Color textOnPrimaryColor = Colors.white70;
  @override
  final Color textBodyColor = Colors.white70;
  @override
  final Color textDisplayColor = Colors.white70;
  @override
  final Color primaryTextBodyColor = Colors.white70;
  @override
  final Color primaryTextDisplayColor = Colors.white70;
  @override
  final Color appBarBackgroundColor = Colors.grey.shade900;
}

class AppTheme {
  ThemeData theme(Palette palette) {
    final theme = ThemeData(
      brightness: palette.brightness,
      primarySwatch: generateMaterialColor(palette.primaryColor),
      accentColor: palette.accentColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryTextTheme: _textThemeHandset.apply(
        bodyColor: palette.primaryTextBodyColor,
        displayColor: palette.primaryTextDisplayColor,
      ),
      textTheme: _textThemeHandset.apply(
        bodyColor: palette.primaryTextBodyColor,
        displayColor: palette.primaryTextDisplayColor,
      ),
      canvasColor: palette.scaffoldBackgroundColor,
      backgroundColor: palette.scaffoldBackgroundColor,
      scaffoldBackgroundColor: palette.scaffoldBackgroundColor,
    );
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        brightness: palette.brightness,
        elevation: 0,
        color: palette.appBarBackgroundColor,
        iconTheme: IconThemeData(
          color: palette.iconColor,
        ),
        actionsIconTheme: IconThemeData(
          color: palette.iconColor,
        ),
        textTheme: _textThemeHandset,
      ),
      cardColor: palette.cardColor,
      colorScheme: theme.colorScheme.copyWith(
        error: palette.errorColor,
        background: palette.scaffoldBackgroundColor,
        surface: palette.scaffoldBackgroundColor,
      ),
      iconTheme: IconThemeData(
        color: palette.iconColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: theme.accentColor,
        selectedIconTheme: const IconThemeData(),
        unselectedIconTheme: const IconThemeData(),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xff93cb80),
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Color(0xff93cb80)),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  TextTheme get _textThemeHandset => TextTheme(
        headline1: GoogleFonts.abrilFatface(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.48,
        ),
        headline2: GoogleFonts.abrilFatface(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.48,
        ),
        headline3: GoogleFonts.abrilFatface(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.48,
        ),
        headline5: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.408,
        ),
        headline6: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.078,
        ),
        subtitle1: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.32,
        ),
        subtitle2: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.64,
        ),
        bodyText1: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.32,
        ),
        bodyText2: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.32,
        ),
        button: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.32,
        ),
        caption: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.32,
        ),
        overline: GoogleFonts.inter(
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

extension ThemeDatas on BuildContext {
  ThemeData get themeData => Theme.of(this);
}

extension TextThemes on BuildContext {
  TextTheme get textThemes => themeData.textTheme;
}

extension AppBarThemes on BuildContext {
  AppBarTheme get appBarThemes => themeData.appBarTheme;
}

extension ColorShemas on BuildContext {
  ColorScheme get colors => themeData.colorScheme;
}
