import '../../enums/shareable_file_type.dart';

abstract class ShareableFileEntity<T> {
  const ShareableFileEntity({
    required this.shareableFileType,
    required this.data,
  });

  final ShareableFileType shareableFileType;

  final T data;
}
