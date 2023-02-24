import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/common/state_type.dart';
import 'package:presentation/screens/{{name.snakeCase()}}/{{name.snakeCase()}}_argument.dart';

part '{{name.snakeCase()}}_bloc.freezed.dart';
part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc({
    required {{name.pascalCase()}}Argument argument,
  }) : super({{name.pascalCase()}}State.initial(argument: argument)) {
    on<_OnInitiated>(_onInitiated);
  }

  Future<void> _onInitiated(_OnInitiated event, Emitter<{{name.pascalCase()}}State> emit) async {}
}
