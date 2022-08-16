import 'package:flutter/widgets.dart';

abstract class Insets {
  const Insets._();

  static const double small = 4;
  static const double xSmall = 8;
  static const double medium = 12;
  static const double large = 16;
  static const double xLarge = 24;
  static const double xxLarge = 32;
  static const double xxxLarge = 42;
}

abstract class Gap {
  const Gap._();

  static const xSmall = SizedBox(height: Insets.xSmall);
  static const small = SizedBox(height: Insets.small);
  static const medium = SizedBox(height: Insets.medium);
  static const large = SizedBox(height: Insets.large);
  static const xLarge = SizedBox(height: Insets.xLarge);
  static const xxLarge = SizedBox(height: Insets.xxLarge);
  static const xxxLarge = SizedBox(height: Insets.xxxLarge);
}

abstract class HorizontalGap {
  const HorizontalGap._();

  static const xSmall = SizedBox(width: Insets.xSmall);
  static const small = SizedBox(width: Insets.small);
  static const medium = SizedBox(width: Insets.medium);
  static const large = SizedBox(width: Insets.large);
  static const xLarge = SizedBox(width: Insets.xLarge);
  static const xxLarge = SizedBox(width: Insets.xxLarge);
  static const xxxLarge = SizedBox(width: Insets.xxxLarge);
}

abstract class SliverGap {
  const SliverGap._();

  static const xSmall = SliverPadding(padding: EdgeInsets.only(top: Insets.xSmall));
  static const small = SliverPadding(padding: EdgeInsets.only(top: Insets.small));
  static const medium = SliverPadding(padding: EdgeInsets.only(top: Insets.medium));
  static const large = SliverPadding(padding: EdgeInsets.only(top: Insets.large));
  static const xLarge = SliverPadding(padding: EdgeInsets.only(top: Insets.xLarge));
  static const xxLarge = SliverPadding(padding: EdgeInsets.only(top: Insets.xxLarge));
  static const xxxLarge = SliverPadding(padding: EdgeInsets.only(top: Insets.xxxLarge));
}
