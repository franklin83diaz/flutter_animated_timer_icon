import 'dart:math';

import 'package:flutter/material.dart';

class CustomRenderBox extends RenderBox {
  double _sideLength;
  Color _color;
  double _percentageFill;

  CustomRenderBox({
    required double sideLength,
    Color color = Colors.blue,
    required percentageFill,
  })  : _sideLength = sideLength,
        _color = color,
        assert(percentageFill >= 0 && percentageFill <= 1),
        _percentageFill = percentageFill;

  set sideLength(double value) {
    if (_sideLength != value) {
      _sideLength = value;
      markNeedsLayout();
    }
  }

  set color(Color value) {
    if (_color != value) {
      _color = value;
      markNeedsPaint();
    }
  }

  set percentageFill(double value) {
    if (_percentageFill != value) {
      _percentageFill = value;
      markNeedsPaint();
    }
  }

  @override
  void performLayout() {
    size = Size(_sideLength, _sideLength);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // Draw the background circle in White
    var paint = Paint()..color = Colors.white;
    context.canvas.drawCircle(size.center(offset), size.width / 2, paint);

    // Draw the percent filled circle
    paint = Paint()..color = _color;
    double angle = 2 * pi * _percentageFill;
    context.canvas.drawArc(
      Rect.fromCenter(
          center: size.center(offset),
          width: size.width - 10,
          height: size.height - 10),
      -pi / 2, // Start angle (90°)
      angle, // angle fill
      true, // fill
      paint,
    );

    // Draw the border circle
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    context.canvas.drawCircle(size.center(offset), size.width / 2, paint);

    // Draw Button
    paint.strokeWidth = size.width / 7;
    angle = 2 * pi * 0.87;
    final center = size.center(offset);
    final radius = size.width / 1.9;
    final Offset start = center + Offset(cos(angle), sin(angle)) * radius;
    final Offset end =
        center + Offset(cos(angle), sin(angle)) * (radius + size.width / 16);
    context.canvas.drawLine(start, end, paint);
  }
}
