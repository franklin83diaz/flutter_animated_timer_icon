import 'package:flutter/material.dart';
import 'package:flutter_animated_timer_icon/src/controller.dart';
import 'package:flutter_animated_timer_icon/src/render_object_widget.dart';

/// AnimateTimer is a widget that animates a timer icon.
///
/// The widget takes in a size, color, animationDuration, and animationBehaviorPreserve.
///
/// The [size] is the side length of the icon.
/// The [color] is the color of the icon.
/// The [animationDuration] is the duration of animation.
/// The [animationBehaviorPreserve] on Linux, this value is recommended set to true.
/// The [animateTimerController] is the controller for the animation.
///
class AnimateTimer extends StatefulWidget {
  const AnimateTimer(
      {super.key,
      this.size = 20,
      this.color = Colors.blue,
      required this.animationDuration,
      required this.animateTimerController,
      this.animationBehaviorPreserve = false});

  final double size;
  final Color color;
  final int animationDuration;
  final bool animationBehaviorPreserve;
  final AnimateTimerController animateTimerController;

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
    widget.animateTimerController.setTimerIconController(_controller);
  }

  @override
  Widget build(BuildContext context) {
    TimerIconWidget timerIconWidget = TimerIconWidget(
      sideLength: widget.size,
      color: widget.color,
      percentageFill: _animation.value,
    );

    return timerIconWidget;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
