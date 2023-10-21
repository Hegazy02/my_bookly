import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bookly/styles.dart';

class BookDetailsRatingRowWidget extends StatelessWidget {
  const BookDetailsRatingRowWidget({
    super.key,
    required this.averageRating,
    required this.ratingsCount,
  });

  final int averageRating;
  final int ratingsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text.rich(
          TextSpan(
              text: "$averageRating",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
              children: <InlineSpan>[
                TextSpan(
                    text: ' ($ratingsCount)', style: Styles.textStyle14Grey)
              ]),
        )
      ],
    );
  }
}
