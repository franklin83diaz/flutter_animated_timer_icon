//create singleton class
import 'package:flutter/material.dart';

class AnimateTimerController {
  late AnimationController _animationController;

  void setTimerIconController(AnimationController c) {
    _animationController = c;
  }

  AnimationController getTimerIconController() {
    return _animationController;
  }

  void restart() {
    _animationController.reset();
    _animationController.forward();
  }

  void stop() {
    _animationController.stop();
  }

  void start() {
    _animationController.forward();
  }
}
