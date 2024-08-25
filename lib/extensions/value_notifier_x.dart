import 'package:flutter/material.dart';

extension ValueNotifierX<T> on ValueNotifier {
  void emit(final T value) => this.value = value;
}
