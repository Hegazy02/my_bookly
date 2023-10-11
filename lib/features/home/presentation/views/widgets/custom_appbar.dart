import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';
import 'package:sizer/sizer.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsPaths.logo,
          scale: 5,
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          iconSize: 26.sp,
        ),
      ],
    );
  }
}
