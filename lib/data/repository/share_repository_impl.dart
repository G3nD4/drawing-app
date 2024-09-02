import 'dart:developer';

import 'package:drawing_application/domain/entities/shareable_file_entity/shareable_file_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

import '../../domain/entities/shareable_file_entity/image_file.dart';
import '../../domain/repository/share_repository.dart';

@LazySingleton(as: ShareRepository)
class ShareRepositoryImpl implements ShareRepository {
  @override
  Future<void> shareTelegram(ShareableFileEntity fileEntity) async {
    if (fileEntity is! ImageFile) {
      log('File is not an instance of ImageFile!');
      return;
    } else {
      Share.shareXFiles(
        [XFile(fileEntity.data.file.path)],
        text:
            'Sent from Flutter Drawing App made by @G3nD4 *Here will be the link to the git repository*',
      );
      // SocialShare. (fileEntity.data.file.path);
    }
  }

  @override
  Future<void> shareWhatsApp(ShareableFileEntity fileEntity) {
    // TODO: implement shareWhatsApp
    throw UnimplementedError();
  }
}
