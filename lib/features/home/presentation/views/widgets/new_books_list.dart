import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/new_books_item.dart';

class NewBooksListWidget extends StatelessWidget {
  final List<BookModel> booksModels;
  const NewBooksListWidget({super.key, required this.booksModels});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: booksModels.length,
      itemBuilder: (context, index) =>
          NewBooksItem(bookModel: booksModels[index]),
    );
  }
}
