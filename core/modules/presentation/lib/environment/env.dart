// ignore_for_file: avoid_classes_with_only_static_members

import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lib/environment/.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'API_URL')
  static final String apiUrl = _Env.apiUrl;
}
