import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/const/log_level.dart';
import '../../domain/entities/picture_entity/picture_entity.dart';
import '../../domain/repository/storage_repository.dart';
import '../../extensions/shared_preferences_x.dart';
import '../../features/drawing/domain/entities/curve_entity.dart';
import '../local_storage_keys/local_storage_keys.dart';

@LazySingleton(as: IPictureRepository)
class PictureRepositoryImpl implements IPictureRepository {
  const PictureRepositoryImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  Future<Either<int, String>> savePicture({
    required String name,
    required List<CurveEntity> curves,
  }) async {
    try {
      final int availablePictureId = await _getAndUpdatePictureId();
      final PictureEntity picture = PictureEntity(
        id: availablePictureId,
        name: name,
        curves: curves,
      );
      final bool savedSuccessfully = await _sharedPreferences.setMap(
          LocalStorageKeys.picturesKey, picture.toJson());

      if (savedSuccessfully) {
        return left(availablePictureId);
      }
    } catch (e) {
      log(
        e.toString(),
        name: 'PictureRepositoryImpl',
        error: e,
        level: LogLevel.exception,
      );
    }
    return right('Failed to save picture');
  }

  Future<int> _getAndUpdatePictureId() async {
    final int availablePictureId =
        _sharedPreferences.getInt(LocalStorageKeys.availablePictureId) ?? 0;
    await _sharedPreferences.setInt(
        LocalStorageKeys.availablePictureId, availablePictureId + 1);
    return availablePictureId;
  }
}
