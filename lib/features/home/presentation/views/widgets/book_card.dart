import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';
import 'package:go_router/go_router.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.bookModel, required this.height});
  final BookModel bookModel;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context)
          .push(AppRouter.KBookDetailesView, extra: bookModel),
      child: SizedBox(
        height: height,
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage(bookModel.cover), fit: BoxFit.fill)),
          ),
        ),
      ),
    );
  }
}
