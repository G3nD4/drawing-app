import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../domain/repository/share_repository.dart';
import '../../../get_it/get_it.dart';
import '../../data/cubit/picture_cubit/picture_cubit.dart';
import '../../domain/entities/enums/stroke_width_enum.dart';
import 'drawing_screen_model.dart';
import 'drawing_screen_wm_impl.dart';

DrawingScreenWM kDrawingScreenWMFactory(BuildContext context) {
  final ShareRepository shareRepository = getIt.get<ShareRepository>();
  final PictureCubit pictureCubit = getIt.get<PictureCubit>();

  return DrawingScreenWM(DrawingScreenModel(
    shareRepository,
    pictureCubit,
  ));
}

abstract interface class IDrawingScreenWM implements IWidgetModel {
  ValueListenable<Offset> get drawingListenable;

  MediaQueryData get query;

  void onPanStart(DragStartDetails details);

  void onPanUpdate(DragUpdateDetails details);

  void onPanEnd(DragEndDetails details);

  void paint(Canvas canvas, Size size);

  bool shouldRepaint(CustomPainter oldDelegate);

  void onColorChanged(Color color);

  void onStrokeWidthChanged(StrokeWidthEnum width);

  void clearDrawing();

  void share();

  void savePicture();
}
