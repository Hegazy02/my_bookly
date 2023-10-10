import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Image.asset(AssetsPaths.logo),
          const Text(
            "Read free books",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
