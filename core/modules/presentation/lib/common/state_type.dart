import 'package:flutter/material.dart';

enum StateType {
  loading,
  loaded,
  empty,
  error,
}

extension StateTypes on StateType {
  T map<T extends Widget>({
    required T Function() loading,
    required T Function() loaded,
    T Function()? error,
    T Function()? empty,
  }) {
    switch (this) {
      case StateType.loading:
        return loading();
      case StateType.loaded:
        return loaded();
      case StateType.empty:
        return empty != null ? empty() : const SizedBox.shrink() as T;
      case StateType.error:
        return error != null ? error() : const SizedBox.shrink() as T;
    }
  }
}
