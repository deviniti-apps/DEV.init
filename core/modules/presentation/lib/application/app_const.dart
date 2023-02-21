import 'package:flutter/animation.dart';

class AppConst {
  const AppConst._();
  static const String assetName = 'assets/.env';
}

abstract class AppMotion {
  const AppMotion._();

  static const duration = Duration(milliseconds: 350);
  static const splashAnimation = Duration(milliseconds: 2500);
  static const splashAnimationDelay = Duration(milliseconds: 1250);
  static const curve = Cubic(0.25, 0.1, 0.25, 1);
}
