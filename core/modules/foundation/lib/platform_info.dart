import 'dart:io';

import 'package:flutter/foundation.dart';

abstract class PlatformInfo {
  bool get isAndroid;

  bool get isIOS;

  String get operatingSystem;

  static PlatformInfo defaultPlatformInfo() => DefaultPlatformInfo();
}

class DefaultPlatformInfo implements PlatformInfo {
  @override
  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  @override
  bool get isIOS => !kIsWeb && Platform.isIOS;

  @override
  String get operatingSystem => Platform.operatingSystem;
}
