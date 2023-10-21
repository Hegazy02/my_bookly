import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/utils/service_locator.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_actions.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_card.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_details_rating_row.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/you_might_also_like_list.dart';
import 'package:my_bookly/features/search/data/repos/search_repo.dart';
import 'package:my_bookly/features/search/presentation/view_model/search/search_cubit.dart';
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
        physics: const BouncingScrollPhysics(),
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
                  child: BookCard(
                      bookModel: bookModel, height: 30.h, isTap: false),
                ),
                Text(
                  bookModel.volumeInfo?.title! ?? 'Missing',
                  style: Styles.textStyle30,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  bookModel.volumeInfo?.authors?[0] ?? 'Missing',
                  style: Styles.textStyle18.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                BookDetailsRatingRowWidget(
                  ratingsCount: bookModel.volumeInfo?.ratingsCount ?? 0,
                  averageRating: bookModel.volumeInfo?.averageRating ?? 0,
                ),
                const SizedBox(
                  height: 37,
                ),
                BookActions(
                    price: bookModel.saleInfo?.retailPrice?.amount ?? 0),
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
          BlocProvider(
            create: (context) => SearchCubit(ServiceLocator.getIt<Search>()),
            child: YouMightAlsoLikeList(
              title: bookModel.volumeInfo?.title ?? 'programming',
            ),
          )
        ],
      ),
    );
  }
}
