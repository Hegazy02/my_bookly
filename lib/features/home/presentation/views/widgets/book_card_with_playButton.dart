import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_card.dart';
import 'package:sizer/sizer.dart';

class BookCardWithPlayButton extends StatelessWidget {
  const BookCardWithPlayButton(
      {super.key, required this.index, required this.currentItem});
  final int index;
  final int currentItem;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        bookCard(index: index, currentItem: currentItem),
        Positioned(
            right: index == currentItem ? 1.h : 1.h,
            bottom: index == currentItem ? 9.h : 12.h,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    size: 28,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
