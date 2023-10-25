import 'package:flutter/material.dart';
import 'package:presentation/l10n/translations.dart';

extension Strings on BuildContext {
  Translations get strings => Translations.of(this)!;
  String get locale => strings.localeName;
}
