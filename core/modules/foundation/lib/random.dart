import 'dart:convert';
import 'dart:math';

String randomString({int length = 32, Random? random}) {
  final rnd = random ?? Random.secure();
  final values = List<int>.generate(length, (i) => rnd.nextInt(256));
  return base64Url.encode(values);
}

class SecureRandom {
  const SecureRandom();

  String getRandomString({int length = 32, Random? random}) {
    return randomString(length: length, random: random);
  }
}
