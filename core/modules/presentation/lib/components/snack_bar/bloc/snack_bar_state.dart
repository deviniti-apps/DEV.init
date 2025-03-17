part of 'snack_bar_bloc.dart';

@freezed
abstract class SnackBarState with _$SnackBarState {
  const factory SnackBarState.initial() = SnackBarInitial;

  const factory SnackBarState.showMessage({
    required SnackBarMessage snackBarMessage,
  }) = SnackBarShowMessage;
}
