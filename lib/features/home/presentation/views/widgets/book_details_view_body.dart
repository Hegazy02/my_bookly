import 'package:flutter/material.dart';
import 'package:my_bookly/core/widgets/custom_button.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_actions.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_card.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_details_rating_row.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/you_might_also_like_list.dart';
import 'package:my_bookly/styles.dart';
import 'package:sizer/sizer.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailsViewBody({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        physics: const ScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomAppbar(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: BookCard(cover: bookModel.cover, height: 30.h),
                ),
                Text(
                  bookModel.title,
                  style: Styles.textStyle30,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  bookModel.authorName,
                  style: Styles.textStyle18.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                BookDetailsRatingRowWidget(rate: bookModel.rate),
                const SizedBox(
                  height: 37,
                ),
                BookActions(price: bookModel.price),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You might also like",
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          const YouMightAlsoLikeList()
        ],
      ),
    );
  }
}
