import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/best_seller_item.dart';

class BestSellerListWidget extends StatelessWidget {
  const BestSellerListWidget({super.key, required this.booksModels});
  final List<BookModel> booksModels;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: AssetsPaths.Kbooks.length,
      itemBuilder: (context, index) =>
          BestSellerItem(booksModels: booksModels, index: index),
    );
  }
}
