import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';

class SplashViewBody extends StatefulWidget {
  SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    slidingAnimation = Tween<Offset>(begin: Offset(0, 10), end: Offset(0, 0))
        .animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AssetsPaths.logo,
            scale: 2,
          ),
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) => SlideTransition(
              position: slidingAnimation,
              child: const Text(
                "Read free books",
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
