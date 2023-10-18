import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/ListView_bookCard_with_PlayButton.dart.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/bestSeller_list.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:my_bookly/styles.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<BookModel> booksModels = [];
  @override
  void initState() {
    AssetsPaths.Kbooks.forEach((element) {
      booksModels.add(BookModel.fromMap(data: element));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppbar(),
          ListViewBookCardWithPlayButton(booksModels: booksModels),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Best Seller",
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: BestSellerListWidget(booksModels: booksModels))
        ],
      ),
    );
  }
}
