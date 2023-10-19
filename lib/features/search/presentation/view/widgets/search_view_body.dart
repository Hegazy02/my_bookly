import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/bestSeller_list.dart';
import 'package:my_bookly/features/search/presentation/view/widgets/search_text_field.dart';
import 'package:my_bookly/styles.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String? searchValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SearchTextField(
            onChanged: (value) {
              setState(() {
                searchValue = value;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Search Result",
              style: Styles.textStyle18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          searchValue != null
              ? Expanded(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      BestSellerListWidget(
                        booksModels: getBooksList(pattern: searchValue!),
                        itemCount: getBooksList(pattern: searchValue!).length,
                      ),
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  List<BookModel> getBooksList({required String pattern}) {
    List<BookModel> temp = [];
    temp = AssetsPaths.Kbooks.map((element) => BookModel.fromMap(data: element))
        .where((e) => e.title.toLowerCase().startsWith(pattern.toLowerCase()))
        .toList();
    print(temp);
    print("${temp.length}");
    return temp;
  }
}
