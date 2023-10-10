import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_card.dart';

class BookCardWithPlayButton extends StatelessWidget {
  const BookCardWithPlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        bookCard(),
        Positioned(
            right: 20,
            bottom: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    size: 28,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
