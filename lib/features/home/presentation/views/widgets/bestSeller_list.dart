import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_card.dart';
import 'package:my_bookly/styles.dart';
import 'package:sizer/sizer.dart';

class BestSellerListWidget extends StatelessWidget {
  const BestSellerListWidget({super.key, required this.booksModels});
  final List<BookModel> booksModels;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverList.builder(
          itemCount: AssetsPaths.Kbooks.length,
          itemBuilder: (context, index) => Row(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 20),
              child: bookCard(
                bookModel: booksModels[index],
                height: 20.h,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    booksModels[index].title,
                    overflow: TextOverflow.clip,
                    style: Styles.textStyle20,
                  ),
                  Text(booksModels[index].authorName,
                      overflow: TextOverflow.ellipsis),
                  Text("${booksModels[index].price}",
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
