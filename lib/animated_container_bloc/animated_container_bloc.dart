import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'animated_container_event.dart';
import 'animated_container_state.dart';

class AnimatedContainerBlock
    extends Bloc<AnimatedContainerEvent, AnimatedContainerState> {
  AnimatedContainerBlock()
      : super(AnimatedContainerStateValue(
            height: 200, width: 200, containerColor: Colors.grey)) {
    final random = Random();
    try {
      on<ChangeContainerBehavior>(
        (event, emit) => emit(
          AnimatedContainerStateValue(
            height: random.nextInt(300).toDouble(),
            width: random.nextInt(300).toDouble(),
            containerColor: Color.fromRGBO(random.nextInt(256),
                random.nextInt(256), random.nextInt(256), 0.5),
          ),
        ),
      );
    } catch (e) {
      throw AnimatedContainerErrorState(e.toString());
    }
  }
}
