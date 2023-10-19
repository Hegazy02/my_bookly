import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsPaths.logo,
          scale: 5,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.KSearchView);
          },
          icon: const Icon(Icons.search),
          iconSize: 26.sp,
        ),
      ],
    );
  }
}
