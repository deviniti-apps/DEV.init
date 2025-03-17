part of '{{name.snakeCase()}}_bloc.dart';

@freezed
abstract class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State({
    required StateType type,
    required {{name.pascalCase()}}Argument argument,
  }) = _{{name.pascalCase()}}State;

  factory {{name.pascalCase()}}State.initial({required {{name.pascalCase()}}Argument argument}) {
    return {{name.pascalCase()}}State(
      type: StateType.loading,
      argument: argument,
    );
  }
}
