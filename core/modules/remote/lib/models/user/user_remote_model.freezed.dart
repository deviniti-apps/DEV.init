// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRemoteModel _$UserRemoteModelFromJson(Map<String, dynamic> json) {
  return _UserRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$UserRemoteModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRemoteModelCopyWith<UserRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRemoteModelCopyWith<$Res> {
  factory $UserRemoteModelCopyWith(
          UserRemoteModel value, $Res Function(UserRemoteModel) then) =
      _$UserRemoteModelCopyWithImpl<$Res, UserRemoteModel>;
  @useResult
  $Res call({int id, String name, String email});
}

/// @nodoc
class _$UserRemoteModelCopyWithImpl<$Res, $Val extends UserRemoteModel>
    implements $UserRemoteModelCopyWith<$Res> {
  _$UserRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRemoteModelCopyWith<$Res>
    implements $UserRemoteModelCopyWith<$Res> {
  factory _$$_UserRemoteModelCopyWith(
          _$_UserRemoteModel value, $Res Function(_$_UserRemoteModel) then) =
      __$$_UserRemoteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String email});
}

/// @nodoc
class __$$_UserRemoteModelCopyWithImpl<$Res>
    extends _$UserRemoteModelCopyWithImpl<$Res, _$_UserRemoteModel>
    implements _$$_UserRemoteModelCopyWith<$Res> {
  __$$_UserRemoteModelCopyWithImpl(
      _$_UserRemoteModel _value, $Res Function(_$_UserRemoteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$_UserRemoteModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRemoteModel implements _UserRemoteModel {
  const _$_UserRemoteModel(
      {required this.id, required this.name, required this.email});

  factory _$_UserRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserRemoteModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'UserRemoteModel(id: $id, name: $name, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRemoteModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRemoteModelCopyWith<_$_UserRemoteModel> get copyWith =>
      __$$_UserRemoteModelCopyWithImpl<_$_UserRemoteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRemoteModelToJson(
      this,
    );
  }
}

abstract class _UserRemoteModel implements UserRemoteModel {
  const factory _UserRemoteModel(
      {required final int id,
      required final String name,
      required final String email}) = _$_UserRemoteModel;

  factory _UserRemoteModel.fromJson(Map<String, dynamic> json) =
      _$_UserRemoteModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_UserRemoteModelCopyWith<_$_UserRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
