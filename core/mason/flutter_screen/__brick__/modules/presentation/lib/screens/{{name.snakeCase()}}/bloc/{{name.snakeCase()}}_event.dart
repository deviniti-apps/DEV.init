part of '{{name.snakeCase()}}_bloc.dart';

@freezed
abstract class {{name.pascalCase()}}Event with _${{name.pascalCase()}}Event {
  const factory {{name.pascalCase()}}Event.onInitiated() = _OnInitiated;
}
