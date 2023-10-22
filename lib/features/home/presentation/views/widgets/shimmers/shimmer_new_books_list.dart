import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/new_books_item.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNewBooksListWidget extends StatelessWidget {
  const ShimmerNewBooksListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[700]!,
        highlightColor: Colors.grey[600]!,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => NewBooksItem(
                  bookModel: BookModel(),
                  isOnTap: false,
                )));
  }
}
