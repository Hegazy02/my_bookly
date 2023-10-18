import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_card.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';

class BookCardWithPlayButton extends StatelessWidget {
  const BookCardWithPlayButton(
      {super.key,
      required this.index,
      required this.currentItem,
      required this.bookModel});
  final int index;
  final int currentItem;
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.KBookDetailesView, extra: bookModel);
      },
      child: Stack(
        children: [
          BookCard(
            cover: bookModel.cover,
            height: index == currentItem ? 25.h : 22.h,
          ),
          Positioned(
              right: index == currentItem ? 1.h : 1.h,
              bottom: index == currentItem ? 2.h : 5.h,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      size: 28,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
