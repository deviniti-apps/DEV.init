part of '_SNAKE_CASE_NAME__bloc.dart';

@freezed
class _UPPER_CAMEL_CASE_NAME_State with _$_UPPER_CAMEL_CASE_NAME_State {
  const factory _UPPER_CAMEL_CASE_NAME_State({
    required StateType type,
    required _UPPER_CAMEL_CASE_NAME_Argument argument,
  }) = __UPPER_CAMEL_CASE_NAME_State;

  factory _UPPER_CAMEL_CASE_NAME_State.initial({required _UPPER_CAMEL_CASE_NAME_Argument argument}) {
    return _UPPER_CAMEL_CASE_NAME_State(
      type: StateType.loading,
      argument: argument,
    );
  }
}
