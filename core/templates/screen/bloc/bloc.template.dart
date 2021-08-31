import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '_SNAKE_CASE_NAME__bloc.freezed.dart';

part '_SNAKE_CASE_NAME__event.dart';

part '_SNAKE_CASE_NAME__state.dart';

class _UPPER_CAMEL_CASE_NAME_Bloc extends Bloc<_UPPER_CAMEL_CASE_NAME_Event, _UPPER_CAMEL_CASE_NAME_State> {
  _UPPER_CAMEL_CASE_NAME_Bloc() : super(_UPPER_CAMEL_CASE_NAME_State.initial());

  @override
  Stream<_UPPER_CAMEL_CASE_NAME_State> mapEventToState(_UPPER_CAMEL_CASE_NAME_Event event,) async* {
    yield state;
  }
}
