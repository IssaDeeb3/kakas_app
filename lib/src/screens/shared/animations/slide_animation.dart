import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum SlideAnimationType { left, right, top, bottom }

class SlideAnimation extends HookWidget {
  final Widget child;
  final Duration duration;
  final SlideAnimationType animationType;
  final Curve? curve;

  const SlideAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 2000),
    this.animationType = SlideAnimationType.left,
    this.curve = Curves.easeInOutBack,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: duration);

    Offset beginOffset;
    Offset endOffset;

    switch (animationType) {
      case SlideAnimationType.left:
        beginOffset = const Offset(-1.6, 0.0);
        endOffset = Offset.zero;
        break;
      case SlideAnimationType.right:
        beginOffset = const Offset(1.6, 0.0);
        endOffset = Offset.zero;
        break;
      case SlideAnimationType.top:
        beginOffset = const Offset(0.0, -1.0);
        endOffset = Offset.zero;
        break;
      case SlideAnimationType.bottom:
        beginOffset = const Offset(0.0, 1.0);
        endOffset = Offset.zero;
        break;
    }

    final offsetAnimation = Tween<Offset>(
      begin: beginOffset,
      end: endOffset,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    ));

    useEffect(() {
      controller.forward();
      return () {
        // controller.dispose();
      };
    }, []);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}
