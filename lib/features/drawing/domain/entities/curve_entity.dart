import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'curve_entity.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CurveEntity with _$CurveEntity {
  const factory CurveEntity(
    @JsonKey(fromJson: pointsFromJson, toJson: pointsToJson)
    List<Offset> points, [
    @Default(Colors.black) Color color,
    @Default(4.0) double strokeWidth,
  ]) = _CurveEntity;

  factory CurveEntity.fromJson(Map<String, dynamic> json) =>
      _$CurveEntityFromJson(json);

  static Map<double, double> pointsToJson(List<Offset> points) {
    final Map<double, double> pointsJson = <double, double>{};
    for (final Offset point in points) {
      pointsJson[point.dx] = point.dy;
    }
    return pointsJson;
  }

  static List<Offset> pointsFromJson(Map<double, double> pointsJson) {
    final List<Offset> points = <Offset>[];
    for (final double dx in pointsJson.keys) {
      points.add(Offset(dx, pointsJson[dx]!));
    }
    return points;
  }
}
