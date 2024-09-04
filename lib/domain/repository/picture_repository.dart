import 'package:dartz/dartz.dart';

import '../../features/drawing/domain/entities/curve_entity.dart';

abstract interface class IPictureRepository {
  Future<Either<int, String>> savePicture({
    required String name,
    required List<CurveEntity> curves,
  });
}
