import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SizeTransitionWidget extends HookWidget {
  final Duration duration;
  final Curve curve;
  final Axis axis;
  final double axisAlignment;
  final Widget child;

  const SizeTransitionWidget({
    super.key,
    required this.duration,
    required this.curve,
    required this.axis,
    required this.axisAlignment,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: duration)..forward();
    final animation = CurvedAnimation(parent: controller, curve: curve);

    return SizeTransition(
      sizeFactor: animation,
      axis: axis,
      axisAlignment: axisAlignment,
      child: child,
    );
  }
}
