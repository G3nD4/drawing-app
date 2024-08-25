import 'dart:developer';
import 'dart:ui';

import 'package:drawing_application/extensions/offset_x.dart';
import 'package:drawing_application/extensions/value_notifier_x.dart';
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
}

class DrawingScreenWM extends WidgetModel<DrawingScreen, DrawingScreenModel>
    implements IDrawingScreenWM {
  DrawingScreenWM() : super(DrawingScreenModel());

  late final ValueNotifier<Offset> _drawingListenable;
  late final List<List<Offset>> _totalCurves;
  late final List<Offset> _currentCurve;
  late double _currentStrokeWidth;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _drawingListenable = ValueNotifier(Offset.zero);
    _totalCurves = List<List<Offset>>.empty(growable: true);
    _currentCurve = List<Offset>.empty(growable: true);
    _currentStrokeWidth = 8.0;
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
    _currentCurve.add(point);
    _drawingListenable.emit(point);
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);
    _currentCurve.add(point);
    _drawingListenable.emit(point);
    log(point.coordinateString);
  }

  @override
  void onPanEnd(DragEndDetails details) {
    log('User ended drawing');
    _totalCurves.add(List.from(_currentCurve));
    _currentCurve.clear();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 4.0
      ..strokeJoin = StrokeJoin.round;

    final List<List<Offset>> curvesToDraw = List.from(_totalCurves)
      ..add(List.from(_currentCurve));
    for (final List<Offset> curve in curvesToDraw) {
      if (curve.isEmpty) {
        return;
      }

      if (curve.length == 1) {
        canvas.drawPoints(PointMode.points, curve, paint);
        return;
      }

      for (int i = 0; i < curve.length - 1; i++) {
        canvas.drawLine(
          Offset(curve[i].dx, curve[i].dy),
          Offset(curve[i + 1].dx, curve[i + 1].dy),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
