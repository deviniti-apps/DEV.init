part of 'snack_bar_bloc.dart';

@freezed
class SnackBarEvent with _$SnackBarEvent {
  const factory SnackBarEvent.showMessageRequested({
    required SnackBarMessage snackBarMessage,
  }) = _SnackBarShowMessageRequested;
}
