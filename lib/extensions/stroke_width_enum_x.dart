import 'package:drawing_application/features/drawing/domain/entities/enums/stroke_width_enum.dart';

const double _minimalWidth = 16.0;
const double _maximalWidth = 32.0;

extension StrokeWidthEnumX on StrokeWidthEnum {
  double get toolbarWidth {
    final double distanceBetween = (_maximalWidth - _minimalWidth) / StrokeWidthEnum.values.length;
    return _minimalWidth + distanceBetween * index;
  }
}
