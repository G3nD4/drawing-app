import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'curve_entity.freezed.dart';
part 'curve_entity.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CurveEntity with _$CurveEntity {
  const factory CurveEntity(
    @JsonKey(
      fromJson: CurveEntity.pointsFromJson,
      toJson: CurveEntity.pointsToJson,
    )
    List<Offset> points, [
    @JsonKey(
      fromJson: CurveEntity.colorFromJson,
      toJson: CurveEntity.colorToJson,
    )
    @Default(Colors.black)
    Color color,
    @Default(4.0) double strokeWidth,
  ]) = _CurveEntity;

  factory CurveEntity.fromJson(Map<String, dynamic> json) =>
      _$CurveEntityFromJson(json);

  static Map<String, double> pointsToJson(List<Offset> points) {
    final Map<String, double> pointsJson = <String, double>{};
    for (final Offset point in points) {
      pointsJson['${point.dx}'] = point.dy;
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

  static Color colorFromJson(String color) => Color(int.parse(color));

  static String colorToJson(Color color) => color.value.toString();
}
