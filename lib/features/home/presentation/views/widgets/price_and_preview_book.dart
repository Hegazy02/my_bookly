import 'package:flutter/material.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/styles.dart';

class PriceAndPreviewBook extends StatelessWidget {
  final int price;
  const PriceAndPreviewBook({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(8))),
              child: Text(
                '${price}\$',
                style: Styles.textStyle16
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: const BoxDecoration(
                  color: MyConstants.KPreviewBookColor,
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(8))),
              child: Text(
                'Free Preview',
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
