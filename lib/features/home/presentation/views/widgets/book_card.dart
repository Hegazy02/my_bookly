import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';
import 'package:sizer/sizer.dart';

class bookCard extends StatelessWidget {
  const bookCard({super.key, required this.index, required this.currentItem});
  final int index;
  final int currentItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: index == currentItem ? 33.h : 30.h,
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(AssetsPaths.KbooksCovers[index]),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
