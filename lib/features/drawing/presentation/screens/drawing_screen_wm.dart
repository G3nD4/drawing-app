import 'dart:developer';
import 'dart:ui';

import 'package:drawing_application/extensions/offset_x.dart';
import 'package:drawing_application/extensions/value_notifier_x.dart';
import 'package:drawing_application/features/drawing/domain/entities/curve_entity.dart';
import 'package:drawing_application/features/drawing/presentation/screens/drawing_screen.dart';
import 'package:drawing_application/features/drawing/presentation/screens/drawing_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

DrawingScreenWM kDrawingScreenWMFactory(BuildContext context) =>
    DrawingScreenWM();

abstract interface class IDrawingScreenWM implements IWidgetModel {
  ValueListenable<Offset> get drawingListenable;

  MediaQueryData get query;

  void onPanStart(DragStartDetails details);

  void onPanUpdate(DragUpdateDetails details);

  void onPanEnd(DragEndDetails details);

  void paint(Canvas canvas, Size size);

  bool shouldRepaint(CustomPainter oldDelegate);

  void onColorChanged(Color color);

  void onStrokeWidthChanged(double width);
}

class DrawingScreenWM extends WidgetModel<DrawingScreen, DrawingScreenModel>
    implements IDrawingScreenWM {
  DrawingScreenWM() : super(DrawingScreenModel());

  // Updates UI on each new point drawn
  late final ValueNotifier<Offset> _drawingListenable;

  // Drawing related
  late final List<CurveEntity> _totalCurves;
  late CurveEntity? _currentCurve;

  // Paint related
  late double _currentStrokeWidth;
  late Color _currentColor;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _drawingListenable = ValueNotifier(Offset.zero);

    _totalCurves = List<CurveEntity>.empty(growable: true);
    _currentCurve = const CurveEntity([]);

    _currentStrokeWidth = 4.0;
    _currentColor = Colors.black;
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
        canvas.drawPoints(PointMode.points, curve.points, paint);
        return;
      }

      for (int i = 0; i < curve.points.length - 1; i++) {
        canvas.drawLine(
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
  void onColorChanged(Color color) {
    _currentColor = color;
  }

  @override
  void onStrokeWidthChanged(double width) {
    _currentStrokeWidth = width;
  }
}
