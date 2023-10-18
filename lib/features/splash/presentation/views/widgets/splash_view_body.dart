import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';
import 'package:my_bookly/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  // SingleTickerProviderStateMixin دا عشان يحسب الثواني صح وميصحلش اي ايرور
  //this in vsync is for SingleTickerProviderStateMixin
  //بحط الويدجت الي فيها الانيميشن جوا انيميتيد بيلدر عشان اخلي الويدجت دي بس هي الي ترفرش بدل ما اخلي كل السكرين تعمل ست ستات عشان ترفرش
  //الكنترولر لو اتساب من غير ديسبوز هيعمل ميموري ليك يعني هيشتغل علفاضي حتى بعد ما اطلع من الشاشه الي هو فيها
  //فعشان كدا لازم استخدم الستاتفل ويدجت مع اي كنترولر
  //لازم اعمل ديسبوز لاي كونترولر من خلال اني احطو جوا الديسبوز ميثود وانادي على الديسبوز ميثود بتاعتو

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
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
            scale: 3,
          ),
          SlidingText(
              animationController: animationController,
              slidingAnimation: slidingAnimation)
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    slidingAnimation = Tween<Offset>(begin: Offset(0, 10), end: Offset(0, 0))
        .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2),
        () => GoRouter.of(context).push(AppRouter.KHomeView));
  }
}
