import 'dart:io';

import 'package:mason/mason.dart';
import 'package:recase/recase.dart';

void run(HookContext context) {
  if (!context.vars['bloc']) {
    final blocDirectory =
        "${Directory.current.path}/modules/presentation/lib/screens/${ReCase(context.vars['name']).snakeCase}/bloc";
    Directory(blocDirectory).delete(recursive: true);
  }
}
