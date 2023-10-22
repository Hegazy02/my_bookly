import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/widgets/diolog.dart';
import 'package:my_bookly/features/home/data/services/downdload_book.dart';

class CustomAppbar extends StatelessWidget {
  final String bookTitle;
  final String? bookUrl;
  const CustomAppbar(
      {super.key, required this.bookUrl, required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(Icons.close),
          iconSize: 26,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            if (bookUrl != null) {
              BooklyDiolog().titleWithOneButton(
                context: context,
                fileName: bookTitle,
                buttonText: 'Download',
                onPressed: () {
                  DownLoadBook().downloadFile(
                      context: context, url: bookUrl!, fileName: bookTitle);
                },
              );
            } else {
              BooklyDiolog().titleWithOneButton(
                context: context,
                fileName: bookTitle,
                buttonText: "Back",
                title: "Sorry, You can't download this book",
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              );
            }
          },
          icon: const Icon(
            Icons.download_outlined,
          ),
          iconSize: 26,
        ),
      ],
    );
  }
}
