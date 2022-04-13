import 'package:flutter/material.dart';

@immutable
class SnackBarMessage {
  const SnackBarMessage({
    required this.message,
    this.background,
    this.icon,
  });

  factory SnackBarMessage.from(String message) {
    return SnackBarMessage(message: message);
  }

  final String message;
  final Color? background;
  final Widget? icon;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SnackBarMessage &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          background == other.background &&
          icon == other.icon;

  @override
  int get hashCode => message.hashCode ^ background.hashCode ^ icon.hashCode;
}
