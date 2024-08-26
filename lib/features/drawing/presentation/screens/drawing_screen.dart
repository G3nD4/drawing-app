import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

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
          GestureDetector(
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
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: ColorToolbar(
                    onColorChanged: wm.onColorChanged,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: StrokeToolbar(
                    onStrokeWidthChanged: wm.onStrokeWidthChanged,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
