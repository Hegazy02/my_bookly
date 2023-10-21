import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:go_router/go_router.dart';

class BookCard extends StatelessWidget {
  const BookCard(
      {super.key,
      required this.bookModel,
      required this.height,
      required this.isTap});
  final BookModel bookModel;
  final double height;
  final bool isTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isTap) {
          GoRouter.of(context)
              .push(AppRouter.KBookDetailesView, extra: bookModel);
        }
      },
      child: SizedBox(
        height: height,
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(bookModel
                            .volumeInfo?.imageLinks!.thumbnail! ??
                        'https://marketplace.canva.com/EAFKA0RgDtw/1/0/1003w/canva-brown-and-orange-elegant-simple-young-adult-fantasy-book-cover-Qb8uSVdJDzw.jpg'),
                    fit: BoxFit.fill)),
          ),
        ),
      ),
    );
  }
}
