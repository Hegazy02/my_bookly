import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';

class bookCard extends StatelessWidget {
  const bookCard({super.key, required this.bookModel, required this.height});
  final BookModel bookModel;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(bookModel.cover), fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
