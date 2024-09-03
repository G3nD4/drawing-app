import 'package:drawing_application/domain/entities/shareable_file_entity/shareable_file_entity.dart';
import 'package:elementary/elementary.dart';

import '../../../../domain/repository/share_repository.dart';
import '../../data/cubit/picture_cubit/picture_cubit.dart';
import '../../domain/entities/curve_entity.dart';

class DrawingScreenModel extends ElementaryModel {
  DrawingScreenModel(
    this._shareRepository,
    this._pictureCubit,
  );

  final ShareRepository _shareRepository;
  final PictureCubit _pictureCubit;

  Stream<PictureState> get pictureStateStream => _pictureCubit.stream;

  Future<void> share(ShareableFileEntity<dynamic> fileEntity) async {
    await _shareRepository.shareTelegram(fileEntity);
  }

  void savePicture({
    required List<CurveEntity> curves,
    required String name,
  }) =>
      _pictureCubit.savePicture(curves: curves, name: name);
}
