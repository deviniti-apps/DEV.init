import 'dart:async';

import 'package:domain/unauth_stream_provider.dart';
import 'package:fpdart/fpdart.dart';

class UnAuthStreamProviderImpl implements UnAuthStreamProvider {
  UnAuthStreamProviderImpl() : _controller = StreamController<Unit>();

  final StreamController<Unit> _controller;

  @override
  Stream<Unit> get stream => _controller.stream;

  @override
  void unauthenticated() => _controller.add(unit);
}
