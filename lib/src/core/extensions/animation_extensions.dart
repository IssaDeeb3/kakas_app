import 'package:flutter/material.dart';
import 'package:kakas_app/src/core/consts/app_constants.dart';
import 'package:kakas_app/src/screens/shared/animations/slide_animation.dart';

extension SlideAnimationExtensions on Widget {
  Widget rightAnimate({
    Duration duration =
        const Duration(milliseconds: AppConsts.slideAnimatedDuration),
    SlideAnimationType animationType = SlideAnimationType.right,
    Curve? curve,
  }) {
    return SlideAnimation(
      duration: duration,
      animationType: animationType,
      curve: curve,
      child: this,
    );
  }

  Widget leftAnimate({
    Duration duration =
        const Duration(milliseconds: AppConsts.slideAnimatedDuration),
    SlideAnimationType animationType = SlideAnimationType.left,
    Curve? curve,
  }) {
    return SlideAnimation(
      duration: duration,
      curve: curve,
      animationType: animationType,
      child: this,
    );
  }

  Widget topAnimate({
    Duration duration =
        const Duration(milliseconds: AppConsts.slideAnimatedDuration),
    SlideAnimationType animationType = SlideAnimationType.top,
    Curve? curve,
  }) {
    return SlideAnimation(
      duration: duration,
      animationType: animationType,
      curve: curve,
      child: this,
    );
  }

  Widget bottomAnimate({
    Duration duration =
        const Duration(milliseconds: AppConsts.slideAnimatedDuration),
    SlideAnimationType animationType = SlideAnimationType.bottom,
    Curve curve = Curves.easeInOutBack,
  }) {
    return SlideAnimation(
      duration: duration,
      animationType: animationType,
      // curve: curve,
      child: this,
    );
  }

  Widget get leftSlide => leftAnimate();

  Widget get rightSlide => rightAnimate();

  Widget get topSlide => topAnimate();

  Widget get bottomSlide => bottomAnimate();
}
