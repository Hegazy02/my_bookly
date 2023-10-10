import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.animationController,
    required this.slidingAnimation,
  });

  final AnimationController animationController;
  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => SlideTransition(
        position: slidingAnimation,
        child: const Text(
          "Read free books",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
