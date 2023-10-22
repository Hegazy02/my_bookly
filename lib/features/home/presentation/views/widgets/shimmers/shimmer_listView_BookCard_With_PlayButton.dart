import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerListViewBookCardWithPlayButton extends StatelessWidget {
  ShimmerListViewBookCardWithPlayButton({super.key});
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[700]!,
        highlightColor: Colors.grey[600]!,
        child: ScrollablePositionedList.separated(
          itemPositionsListener: itemPositionsListener,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return AspectRatio(
                aspectRatio: 2.6 / 4,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red),
                ));
          },
        ),
      ),
    );
  }
}
