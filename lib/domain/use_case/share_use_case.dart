import 'package:drawing_application/domain/repository/share_repository.dart';
import 'package:drawing_application/domain/use_case/i_use_case.dart';
import 'package:drawing_application/features/get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../entities/shareable_file_entity/shareable_file_entity.dart';

@Injectable(as: UseCase)
class ShareUseCase implements UseCase {
  const ShareUseCase(this._file);

  final ShareableFileEntity _file;

  @override
  Future<void> execute() async {
    getIt.get<ShareRepository>().shareTelegram(_file);
  }
}
