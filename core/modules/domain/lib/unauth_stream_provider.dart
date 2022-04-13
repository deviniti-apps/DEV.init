import 'package:fpdart/fpdart.dart';

abstract class UnAuthStreamProvider {
  Stream<Unit> get stream;

  void unauthenticated();
}
