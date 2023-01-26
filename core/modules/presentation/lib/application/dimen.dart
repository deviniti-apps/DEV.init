import 'package:flutter/widgets.dart';

abstract class Insets {
  const Insets._();

  static const double xSmall = 4;
  static const double small = 8;
  static const double medium = 12;
  static const double large = 16;
  static const double xLarge = 24;
  static const double xxLarge = 32;
  static const double xxxLarge = 48;
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
