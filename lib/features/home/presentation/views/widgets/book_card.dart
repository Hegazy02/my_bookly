import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:go_router/go_router.dart';

class BookCard extends StatelessWidget {
  const BookCard(
      {super.key,
      required this.bookModel,
      required this.height,
      required this.isTap});
  final BookModel bookModel;
  final double height;
  final bool isTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (isTap) {
            GoRouter.of(context)
                .push(AppRouter.KBookDetailesView, extra: bookModel);
          }
        },
        child: SizedBox(
          height: height,
          child: AspectRatio(
            aspectRatio: 2.6 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                    'https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/rm380-12_1-knzovkoi.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=590e553438527f2216024b804876d274',
                // progressIndicatorBuilder: (context, url, downloadProgress) =>
                //     Center(
                //         child: CircularProgressIndicator(
                //             value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ));
  }
}
