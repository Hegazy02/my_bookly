import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';
import 'package:sizer/sizer.dart';

class bookCard extends StatelessWidget {
  const bookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 20.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(AssetsPaths.KbooksCovers[1]),
              fit: BoxFit.fill)),
    );
  }
}
