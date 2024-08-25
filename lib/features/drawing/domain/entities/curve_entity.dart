import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'curve_entity.freezed.dart';

@freezed
@immutable
class CurveEntity with _$CurveEntity {
  const CurveEntity._();

  const factory CurveEntity(
    final List<Offset> points, [
    @Default(Colors.black) Color color,
    @Default(4.0) double strokeWidth,
  ]) = _CurveEntity;
}
