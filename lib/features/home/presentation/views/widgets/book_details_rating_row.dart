import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bookly/styles.dart';

class BookDetailsRatingRowWidget extends StatelessWidget {
  const BookDetailsRatingRowWidget({
    super.key,
    required this.rate,
  });

  final int rate;

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
              text: "$rate",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
              children: const <InlineSpan>[
                TextSpan(text: ' (2800)', style: Styles.textStyle14Grey)
              ]),
        )
      ],
    );
  }
}
