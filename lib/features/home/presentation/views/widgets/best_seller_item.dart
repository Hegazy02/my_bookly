import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_card.dart';
import 'package:my_bookly/styles.dart';
import 'package:sizer/sizer.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
    required this.booksModels,
    required this.index,
  });

  final List<BookModel> booksModels;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 20),
        child: BookCard(
          bookModel: booksModels[index],
          height: 17.h,
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
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.yellow,
                  size: 14,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text.rich(TextSpan(
                    text: '${booksModels[index].rate}',
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.bold),
                    children: const <InlineSpan>[
                      TextSpan(text: ' (2800)', style: Styles.textStyle14Grey)
                    ])),
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
