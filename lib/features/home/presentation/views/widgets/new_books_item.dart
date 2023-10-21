import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_card.dart';
import 'package:my_bookly/styles.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';

class NewBooksItem extends StatelessWidget {
  const NewBooksItem({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.KBookDetailesView, extra: bookModel);
      },
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 20),
          child: BookCard(
            bookModel: bookModel,
            height: 17.h,
            isTap: true,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bookModel.volumeInfo?.title ?? 'Missing',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Styles.textStyle20
                    .copyWith(fontFamily: MyConstants.KgtSectraFine),
              ),
              Text(
                bookModel.volumeInfo?.authors?[0] ?? "Missing",
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle14Grey
                    .copyWith(color: Colors.grey, fontSize: 12),
              ),
              Row(
                children: [
                  Text(
                    "${bookModel.saleInfo?.retailPrice?.amount ?? 0} ${bookModel.saleInfo?.retailPrice?.currencyCode}",
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.bold),
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
                      text: '${bookModel.volumeInfo?.averageRating ?? 0}',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.bold),
                      children: <InlineSpan>[
                        TextSpan(
                            text:
                                ' (${bookModel.volumeInfo?.ratingsCount ?? 0})',
                            style: Styles.textStyle14Grey)
                      ])),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
