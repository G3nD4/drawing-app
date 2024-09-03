import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/drawing/domain/entities/curve_entity.dart';

part 'picture_entity.freezed.dart';

@Freezed()
class PictureEntity with _$PictureEntity {
  const factory PictureEntity({
    required int id,
    @JsonKey(
      fromJson: PictureEntity.curvesFromJson,
      toJson: PictureEntity.curvesToJson,
    )
    required List<CurveEntity> curves,
    @Assert('name.isNotEmpty', 'Picture name cannot be empty!')
    required String name,
  }) = _PictureEntity;

  factory PictureEntity.fromJson(Map<String, dynamic> json) =>
      _$PictureEntityFromJson(json);

  static List<Map<String, dynamic>> curvesToJson(List<CurveEntity> curves) =>
      curves.map((CurveEntity curve) => curve.toJson()).toList();

  static List<CurveEntity> curvesFromJson(List<Map<String, dynamic>> json) =>
      json
          .map((Map<String, dynamic> curveJson) =>
              CurveEntity.fromJson(curveJson))
          .toList();
}
