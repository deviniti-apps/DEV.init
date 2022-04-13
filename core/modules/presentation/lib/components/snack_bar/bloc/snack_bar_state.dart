part of 'snack_bar_bloc.dart';

@freezed
class SnackBarState with _$SnackBarState {
  const factory SnackBarState.initial() = _SnackBarInitial;

  const factory SnackBarState.showMessage({
    required SnackBarMessage snackBarMessage,
  }) = _SnackBarShowMessage;
}
