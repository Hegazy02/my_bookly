import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_card.dart';
import 'package:sizer/sizer.dart';

class YouMightAlsoLikeList extends StatelessWidget {
  const YouMightAlsoLikeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 15.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: AssetsPaths.Kbooks.length,
          itemBuilder: (context, index) => BookCard(
              bookModel: BookModel.fromMap(data: AssetsPaths.Kbooks[index]),
              height: 15.h),
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
        ),
      ),
    );
  }
}
