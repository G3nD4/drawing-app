import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../common/widgets/confirm_dialog.dart';
import '../../../../common/widgets/info_dialog.dart';
import '../../../../common/widgets/prompt_string_field_dialog.dart';
import '../../../../domain/entities/picture_entity/picture_entity.dart';
import '../../../../domain/entities/shareable_file_entity/image_file.dart';
import '../../../../domain/enums/shareable_file_type.dart';
import '../../../../domain/use_case/i_use_case.dart';
import '../../../../extensions/offset_x.dart';
import '../../../../extensions/value_notifier_x.dart';
import '../../data/cubit/picture_cubit/picture_cubit.dart';
import '../../domain/entities/curve_entity.dart';
import '../../domain/entities/enums/stroke_width_enum.dart';
import 'drawing_screen.dart';
import 'drawing_screen_model.dart';
import 'i_drawing_screen_wm.dart';

class DrawingScreenWM extends WidgetModel<DrawingScreen, DrawingScreenModel>
    implements IDrawingScreenWM {
  DrawingScreenWM(super._model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _drawingListenable = ValueNotifier<Offset>(Offset.zero);

    _totalCurves = List<CurveEntity>.empty(growable: true);
    _currentCurve = const CurveEntity(<Offset>[]);

    _currentStrokeWidth = 4.0;
    _currentColor = Colors.black;

    _intiPictureRecorder();

    _pictureStateSubscription = model.pictureStateStream.listen(
      (final PictureState state) => state.whenOrNull(
        saveFailure: (final String failure) => alertInfoDialog(
          context,
          body: failure,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pictureStateSubscription.cancel();
    super.dispose();
  }

  @override
  ValueListenable<Offset> get drawingListenable => _drawingListenable;

  @override
  MediaQueryData get query => MediaQuery.of(context);

  @override
  void onPanStart(DragStartDetails details) {
    log('User started drawing');
    final RenderBox box = (context.findRenderObject() as RenderBox?)!;
    final Offset point = box.globalToLocal(details.globalPosition);
    _currentCurve = CurveEntity(
      <Offset>[point],
      _currentColor,
      _currentStrokeWidth,
    );
    _drawingListenable.emit(point);
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    final RenderBox box = (context.findRenderObject() as RenderBox?)!;
    final Offset point = box.globalToLocal(details.globalPosition);
    _currentCurve!.points.add(point);
    _drawingListenable.emit(point);
  }

  @override
  void onPanEnd(DragEndDetails details) {
    log('User ended drawing');
    _totalCurves.add(_currentCurve!.copyWith());
    _currentCurve = null;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final List<CurveEntity> curvesToDraw = List<CurveEntity>.from(_totalCurves);
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
  void clearDrawing() {
    alertConfirmationDialog(
      context,
      title: 'Clear drawing?',
      confirmationText: 'Are you sure you want to clear your drawing?',
    ).then(
      (bool value) {
        if (value) {
          _totalCurves.clear();
          _currentCurve = null;
          _drawingListenable.emit(Offset.zero);
        }
      },
    );
  }

  @override
  void share() {
    _convertDrawingIntoJpg().then((File? value) {
      if (value != null) {
        model.share(ImageFile(
          data: FileImage(value),
          shareableFileType: ShareableFileType.image,
        ));
      }
      _intiPictureRecorder();
    });
  }

  @override
  void savePicture() => alertPromptStringField(
        context,
        title: 'Name of picture',
      ).then((String? name) => model.savePicture(
            name: name ?? '',
            curves: _totalCurves,
          ));

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

  Future<File?> _convertDrawingIntoJpg() async {
    try {
      final ui.Picture picture = recorder!.endRecording();
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
      final File jpgImageFile = File('${dir.path}/flutter_image.jpg')
        ..writeAsBytesSync(
          encodeJpg(jpgImageDecoded),
        );

      return jpgImageFile;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

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

  late final StreamSubscription<PictureState> _pictureStateSubscription;
}
