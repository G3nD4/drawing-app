import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  const Painter({
    required this.onPaint,
    required this.onShouldRepaint,
  });

  final void Function(Canvas canvas, Size size) onPaint;
  final bool Function(CustomPainter oldDelegate) onShouldRepaint;

  @override
  void paint(Canvas canvas, Size size) => onPaint(canvas, size);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      onShouldRepaint(oldDelegate);
}
