import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_card.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/shimmers/shimmer_you_may_also_like_list.dart';
import 'package:my_bookly/features/search/presentation/view_model/search/search_cubit.dart';
import 'package:my_bookly/styles.dart';
import 'package:sizer/sizer.dart';

class YouMightAlsoLikeList extends StatefulWidget {
  final String title;
  const YouMightAlsoLikeList({super.key, required this.title});

  @override
  State<YouMightAlsoLikeList> createState() => _YouMightAlsoLikeListState();
}

class _YouMightAlsoLikeListState extends State<YouMightAlsoLikeList> {
  @override
  void initState() {
    searchForSimilarBooks();
    super.initState();
  }

  searchForSimilarBooks() async {
    await BlocProvider.of<SearchCubit>(context)
        .searchedBooks(searchedValue: widget.title, isNewList: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 15.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: state.searchedBooks.length,
                itemBuilder: (context, index) => BookCard(
                  bookModel: state.searchedBooks[index],
                  height: 15.h,
                  isTap: true,
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
              ),
            ),
          );
        } else if (state is SearchFailure) {
          return SliverToBoxAdapter(
            child: Text(
              "Error : ${state.errMessage}",
              style: Styles.textStyle14,
            ),
          );
        } else {
          return const ShimmerYouMayAlsoLikeList();
        }
      },
    );
  }
}
