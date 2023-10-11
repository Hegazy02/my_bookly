import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/ListView_bookCard_with_PlayButton.dart.dart';
import 'package:sizer/sizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbar(),
          ListViewBookCardWithPlayButton(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Best Seller",
          )
        ],
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsPaths.logo,
          scale: 5,
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          iconSize: 26.sp,
        ),
      ],
    );
  }
}
