import 'dart:ui';

import 'package:drawing_application/domain/entities/shareable_file_entity/shareable_file_entity.dart';
import 'package:flutter/cupertino.dart';

class ImageFile extends ShareableFileEntity<FileImage> {
  const ImageFile({
    required super.data,
    required super.shareableFileType,
  });
}
