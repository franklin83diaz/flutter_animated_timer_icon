import 'package:flutter/material.dart';
import 'package:flutter_animated_timer_icon/src/render_object_widget.dart';

class AnimateTimer extends StatefulWidget {
  const AnimateTimer(
      {super.key,
      this.size = 20,
      this.color = Colors.blue,
      required this.animationDuration,
      this.animationBehaviorPreserve = false});

  final double size;
  final Color color;
  final int animationDuration;
  final bool animationBehaviorPreserve;

  @override
  State<AnimateTimer> createState() => _AnimateTimerState();
}

class _AnimateTimerState extends State<AnimateTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      animationBehavior: widget.animationBehaviorPreserve
          ? AnimationBehavior.preserve
          : AnimationBehavior.normal,
      vsync: this,
      duration: Duration(seconds: widget.animationDuration),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return TimerIconWidget(
      sideLength: widget.size,
      color: widget.color,
      percentageFill: _animation.value,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
