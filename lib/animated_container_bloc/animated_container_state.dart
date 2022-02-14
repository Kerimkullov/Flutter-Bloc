import 'package:flutter/material.dart';

abstract class AnimatedContainerState {}

class AnimatedContainerStateValue extends AnimatedContainerState {
  double height;
  double width;
  Color containerColor;
  AnimatedContainerStateValue({
    required this.height,
    required this.width,
    required this.containerColor,
  });
}

class AnimatedContainerErrorState extends AnimatedContainerState {
  String message;
  AnimatedContainerErrorState(this.message);
}
