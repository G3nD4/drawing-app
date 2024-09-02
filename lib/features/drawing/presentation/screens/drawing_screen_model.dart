import 'package:drawing_application/domain/entities/shareable_file_entity/shareable_file_entity.dart';
import 'package:elementary/elementary.dart';

import '../../../../domain/repository/share_repository.dart';

class DrawingScreenModel extends ElementaryModel {
  DrawingScreenModel(this._shareRepository);

  final ShareRepository _shareRepository;

  void share(ShareableFileEntity fileEntity) async {
    await _shareRepository.shareTelegram(fileEntity);
  }
}
