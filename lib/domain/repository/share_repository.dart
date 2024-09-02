import '../entities/shareable_file_entity/shareable_file_entity.dart';

abstract interface class ShareRepository {
  Future<void> shareWhatsApp(ShareableFileEntity fileEntity);

  Future<void> shareTelegram(ShareableFileEntity fileEntity);
}
