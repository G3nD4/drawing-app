import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../widgets/clear_drawing_button.dart';
import 'drawing_screen_wm.dart';
import '../widgets/painter.dart';
import '../widgets/stroke_toolbar.dart';
import '../widgets/color_toolbar.dart';

@RoutePage()
class DrawingScreen extends ElementaryWidget<IDrawingScreenWM> {
  const DrawingScreen({super.key}) : super(kDrawingScreenWMFactory);

  @override
  Widget build(IDrawingScreenWM wm) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: GestureDetector(
              onPanStart: wm.onPanStart,
              onPanUpdate: wm.onPanUpdate,
              onPanEnd: wm.onPanEnd,
              child: RepaintBoundary(
                child: SizedBox(
                  width: wm.query.size.width,
                  height: wm.query.size.height,
                  child: ValueListenableBuilder<Offset>(
                    valueListenable: wm.drawingListenable,
                    builder: (_, final Offset newOffset, __) {
                      return CustomPaint(
                        painter: Painter(
                          onPaint: wm.paint,
                          onShouldRepaint: wm.shouldRepaint,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColorToolbar(
                    onColorChanged: wm.onColorChanged,
                  ),
                  StrokeToolbar(
                    onStrokeWidthChanged: wm.onStrokeWidthChanged,
                  ),
                  const SizedBox(height: 32.0),
                  ClearDrawingButton(
                    onClearPressed: wm.clearDrawing,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
