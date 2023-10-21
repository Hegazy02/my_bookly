import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_details_view_body.dart';

class BookDetailesView extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailesView({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BookDetailsViewBody(
        bookModel: bookModel,
      )),
    );
  }
}
