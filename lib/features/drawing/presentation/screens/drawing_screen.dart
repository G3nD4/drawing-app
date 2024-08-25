import 'package:auto_route/auto_route.dart';
import 'package:drawing_application/features/drawing/presentation/screens/drawing_screen_wm.dart';
import 'package:drawing_application/features/drawing/presentation/widgets/color_toolbar.dart';
import 'package:drawing_application/features/drawing/presentation/widgets/stroke_toolbar.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/painter.dart';

@RoutePage()
class DrawingScreen extends ElementaryWidget<IDrawingScreenWM> {
  const DrawingScreen({super.key}) : super(kDrawingScreenWMFactory);

  @override
  Widget build(IDrawingScreenWM wm) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: ColorToolbar(),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: StrokeToolbar(),
                ),
              ],
            ),
          ),
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
        ],
      ),
    );
  }
}
