// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PictureEntityImpl _$$PictureEntityImplFromJson(Map<String, dynamic> json) =>
    _$PictureEntityImpl(
      id: (json['id'] as num).toInt(),
      curves: PictureEntity.curvesFromJson(
          json['curves'] as List<Map<String, dynamic>>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$PictureEntityImplToJson(_$PictureEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'curves': PictureEntity.curvesToJson(instance.curves),
      'name': instance.name,
    };
