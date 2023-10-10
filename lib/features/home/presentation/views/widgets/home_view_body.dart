import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(),
      ],
    );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          AssetsPaths.logo,
          scale: 5,
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          iconSize: 36,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
