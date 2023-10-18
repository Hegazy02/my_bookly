import 'package:flutter/material.dart';
import 'package:my_bookly/constants.dart';
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
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.textStyle20
                        .copyWith(fontFamily: MyConstants.KgtSectraFine),
                  ),
                  Text(
                    booksModels[index].authorName,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14Grey
                        .copyWith(color: Colors.grey, fontSize: 12),
                  ),
                  Row(
                    children: [
                      Text(
                        "${booksModels[index].price}\$",
                        style: Styles.textStyle16
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text.rich(TextSpan(
                          text: '4.8',
                          style: Styles.textStyle14
                              .copyWith(fontWeight: FontWeight.bold),
                          children: const <InlineSpan>[
                            TextSpan(
                                text: '(2800)', style: Styles.textStyle14Grey)
                          ])),
                    ],
                  ),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
