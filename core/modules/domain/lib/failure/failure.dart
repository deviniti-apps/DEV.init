import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.unexpected() = _Unexpected;
  const factory Failure.connectTimeout() = _ConnectTimeout;
  const factory Failure.sendTimeout() = _SendTimeout;
  const factory Failure.receiveTimeout() = _ReceiveTimeout;
  const factory Failure.cancel() = _Cancel;
  const factory Failure.defaultType() = _DefaultType;
}
