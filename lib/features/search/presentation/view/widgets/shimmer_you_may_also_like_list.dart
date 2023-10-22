import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_card.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerYouMayAlsoLikeList extends StatelessWidget {
  const ShimmerYouMayAlsoLikeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 15.h,
        child: Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[600]!,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => BookCard(
                bookModel: BookModel(),
                height: 15.h,
                isTap: false,
              ),
            )),
      ),
    );
  }
}
