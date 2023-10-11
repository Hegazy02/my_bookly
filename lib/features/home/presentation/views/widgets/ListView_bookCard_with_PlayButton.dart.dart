import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_card_with_playButton.dart';
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
    selectItem();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ScrollablePositionedList.separated(
        itemPositionsListener: itemPositionsListener,
        scrollDirection: Axis.horizontal,
        itemCount: AssetsPaths.KbooksCovers.length,
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return BookCardWithPlayButton(index: index, currentItem: currentItem);
        },
      ),
    );
    //  CustomScrollView(
    //   scrollDirection: Axis.horizontal,

    //   slivers: [
    //     SliverList.separated(
    //       separatorBuilder: (context, index) => SizedBox(
    //         width: 20,
    //       ),
    //       itemCount: 5,
    //       itemBuilder: (context, index) => BookCardWithPlayButton(index: index),
    //     ),

    //   ],
    // );
  }

  void selectItem() {
    itemPositionsListener.itemPositions.addListener(() {
      indexes = itemPositionsListener.itemPositions.value
          .where((element) {
            final bool isTopVisible = element.itemLeadingEdge >= 0;
            final bool isBottomVisible = element.itemTrailingEdge <= 1;
            return isTopVisible && isBottomVisible;
          })
          .map((e) => e.index)
          .toList();
      print(indexes);
      setState(() {
        currentItem = indexes.isNotEmpty ? indexes[0] : 0;
      });
    });
  }
}
