import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/features/home/presentation/view_model/featured_book_cubit/book_featured_cubit.dart';
import 'package:my_bookly/features/home/presentation/view_model/featured_book_cubit/book_featured_state.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_card_with_playButton.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/shimmers/shimmer_listView_BookCard_With_PlayButton.dart';
import 'package:my_bookly/styles.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizer/sizer.dart';

class ListViewBookCardWithPlayButton extends StatefulWidget {
  const ListViewBookCardWithPlayButton({super.key});

  @override
  State<ListViewBookCardWithPlayButton> createState() =>
      _ListViewBookCardWithPlayButtonState();
}

class _ListViewBookCardWithPlayButtonState
    extends State<ListViewBookCardWithPlayButton> {
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  int currentItem = 0;
  List indexes = [];
  @override
  void initState() {
    // changeSelectedItemSize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: 25.h,
            child: ScrollablePositionedList.separated(
              itemPositionsListener: itemPositionsListener,
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return BookCardWithPlayButton(
                  index: index,
                  currentItem: currentItem,
                  bookModel: state.books[index],
                );
              },
            ),
          );
        } else if (state is FeaturedBookFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: Styles.textStyle18,
            ),
          );
        } else {
          return ShimmerListViewBookCardWithPlayButton();
        }
      },
    );
  }

  // void changeSelectedItemSize() {
  //   itemPositionsListener.itemPositions.addListener(() {
  //     indexes = itemPositionsListener.itemPositions.value
  //         .where((element) {
  //           final bool isTopVisible = element.itemLeadingEdge >= 0;
  //           final bool isBottomVisible = element.itemTrailingEdge <= 1;
  //           return isTopVisible && isBottomVisible;
  //         })
  //         .map((e) => e.index)
  //         .toList();
  //     print(indexes);
  //     selectItem();
  //   });
  // }

  // void selectItem() {
  //   setState(() {
  //     currentItem = indexes.isNotEmpty ? indexes[0] : 0;
  //     if (indexes.length > 1 && indexes[1] == widget.booksModels.length - 1) {
  //       currentItem = indexes[1];
  //     }
  //   });
  // }
}
