import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.cover, required this.height});
  final String cover;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image:
                  DecorationImage(image: AssetImage(cover), fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
