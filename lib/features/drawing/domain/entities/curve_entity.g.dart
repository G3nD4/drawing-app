// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curve_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurveEntityImpl _$$CurveEntityImplFromJson(Map<String, dynamic> json) =>
    _$CurveEntityImpl(
      CurveEntity.pointsFromJson(json['points'] as Map<double, double>),
      json['color'] == null
          ? Colors.black
          : CurveEntity.colorFromJson(json['color'] as String),
      (json['strokeWidth'] as num?)?.toDouble() ?? 4.0,
    );

Map<String, dynamic> _$$CurveEntityImplToJson(_$CurveEntityImpl instance) =>
    <String, dynamic>{
      'points': CurveEntity.pointsToJson(instance.points),
      'color': CurveEntity.colorToJson(instance.color),
      'strokeWidth': instance.strokeWidth,
    };
