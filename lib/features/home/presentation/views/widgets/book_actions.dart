import 'package:flutter/material.dart';
import 'package:my_bookly/core/widgets/custom_button.dart';

class BookActions extends StatelessWidget {
  final double price;
  const BookActions({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CusttomButton(
              text: price.toString(),
              onPressed: () {},
              textColor: Colors.black,
              backgroundColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: CusttomButton(
              onPressed: () {},
              text: "Free Preview",
              textColor: Colors.white,
              backgroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
