import 'package:flutter/material.dart';
import 'package:flutter_animated_timer_icon/src/render_box.dart';

class TimerIconWidget extends LeafRenderObjectWidget {
  const TimerIconWidget({
    Key? key,
    required this.sideLength,
    required this.color,
    required this.percentageFill,
  }) : super(key: key);

  final double sideLength;
  final Color color;
  final double percentageFill;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomRenderBox(
        sideLength: sideLength, color: color, percentageFill: percentageFill);
  }

  @override
  void updateRenderObject(BuildContext context, CustomRenderBox renderObject) {
    renderObject
      ..sideLength = sideLength
      ..percentageFill = percentageFill
      ..color = color;
  }
}
