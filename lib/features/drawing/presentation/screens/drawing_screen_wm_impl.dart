import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:drawing_application/domain/entities/shareable_file_entity/image_file.dart';
import 'package:drawing_application/domain/enums/shareable_file_type.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart';

import '../../../../common/widgets/confirm_dialog.dart';
import 'package:drawing_application/extensions/offset_x.dart';
import 'package:drawing_application/extensions/value_notifier_x.dart';
import 'package:drawing_application/features/drawing/domain/entities/curve_entity.dart';
import 'package:drawing_application/features/drawing/presentation/screens/drawing_screen.dart';
import 'package:drawing_application/features/drawing/presentation/screens/drawing_screen_model.dart';

import '../../domain/entities/enums/stroke_width_enum.dart';
import 'i_drawing_screen_wm.dart';

class DrawingScreenWM extends WidgetModel<DrawingScreen, DrawingScreenModel>
    implements IDrawingScreenWM {
  DrawingScreenWM(super._model);

  // Updates UI on each new point drawn
  late final ValueNotifier<Offset> _drawingListenable;

  // Drawing related
  late final List<CurveEntity> _totalCurves;
  late CurveEntity? _currentCurve;

  // Paint related
  late double _currentStrokeWidth;
  late ui.Color _currentColor;

  // Image generation related
  ui.PictureRecorder? recorder;
  ui.Canvas? imageCanvas;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _drawingListenable = ValueNotifier(Offset.zero);

    _totalCurves = List<CurveEntity>.empty(growable: true);
    _currentCurve = const CurveEntity([]);

    _currentStrokeWidth = 4.0;
    _currentColor = Colors.black;

    _intiPictureRecorder();
  }

  @override
  ValueListenable<Offset> get drawingListenable => _drawingListenable;

  @override
  MediaQueryData get query => MediaQuery.of(context);

  @override
  void onPanStart(DragStartDetails details) {
    log('User started drawing');
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);
    log(point.coordinateString);
    _currentCurve = CurveEntity([point], _currentColor, _currentStrokeWidth);
    _drawingListenable.emit(point);
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);
    _currentCurve = _currentCurve!.copyWith(
      points: _currentCurve!.points + [point],
    );
    _drawingListenable.emit(point);
    log(point.coordinateString);
  }

  @override
  void onPanEnd(DragEndDetails details) {
    log('User ended drawing');
    _totalCurves.add(_currentCurve!.copyWith());
    _currentCurve = null;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final List<CurveEntity> curvesToDraw = List.from(_totalCurves);
    if (_currentCurve != null) {
      curvesToDraw.add(_currentCurve!);
    }
    for (final CurveEntity curve in curvesToDraw) {
      if (curve.points.isEmpty) {
        return;
      }

      final Paint paint = Paint()
        ..strokeWidth = curve.strokeWidth
        ..color = curve.color
        ..strokeJoin = StrokeJoin.round;

      if (curve.points.length == 1) {
        canvas.drawPoints(ui.PointMode.points, curve.points, paint);
        imageCanvas!.drawPoints(ui.PointMode.points, curve.points, paint);

        return;
      }

      for (int i = 0; i < curve.points.length - 1; i++) {
        canvas.drawLine(
          Offset(curve.points[i].dx, curve.points[i].dy),
          Offset(curve.points[i + 1].dx, curve.points[i + 1].dy),
          paint,
        );
        imageCanvas!.drawLine(
          Offset(curve.points[i].dx, curve.points[i].dy),
          Offset(curve.points[i + 1].dx, curve.points[i + 1].dy),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  void onColorChanged(ui.Color color) {
    _currentColor = color;
  }

  @override
  void onStrokeWidthChanged(StrokeWidthEnum strokeWidth) {
    _currentStrokeWidth = strokeWidth.width;
  }

  @override
  void clearDrawing() async {
    alertConfirmationDialog(
      context,
      title: 'Clear drawing?',
      confirmationText: 'Are you sure you want to clear your drawing?',
      confirm: 'Yes',
      deny: 'No',
    ).then(
      (value) {
        if (value) {
          _totalCurves.clear();
          _currentCurve = null;
          _drawingListenable.emit(Offset.zero);
        }
      },
    );
  }

  @override
  void share() async {
    _convertDrawingIntoPng().then((File? value) {
      if (value != null) {
        model.share(ImageFile(
          data: FileImage(value),
          shareableFileType: ShareableFileType.image,
        ));
      }
      _intiPictureRecorder();
    });
  }

  void _intiPictureRecorder() {
    recorder = ui.PictureRecorder();
    imageCanvas = ui.Canvas(
        recorder!,
        Rect.fromPoints(
            Offset.zero,
            Offset(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            )))
      ..drawRect(
          Rect.fromPoints(
              Offset.zero,
              Offset(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height,
              )),
          Paint()..color = Colors.white);
  }

  Future<File?> _convertDrawingIntoPng() async {
    try {
      final picture = recorder!.endRecording();
      final ui.Image image = await picture.toImage(
        MediaQuery.of(context).size.width.toInt(),
        MediaQuery.of(context).size.height.toInt(),
      );
      final Directory dir = await getTemporaryDirectory();
      final String path = '${dir.path}/flutter_image.png';
      final File file = File(path);
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        log('byteData is null');
        return null;
      }
      await file.writeAsBytes(byteData.buffer.asInt8List());

      final jpgImageDecoded = decodeImage(file.readAsBytesSync())!;
      final jpgImageFile = File('${dir.path}/flutter_image.jpg')
        ..writeAsBytesSync(
          encodeJpg(jpgImageDecoded),
        );

      return jpgImageFile;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
