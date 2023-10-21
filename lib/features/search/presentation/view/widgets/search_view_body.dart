import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/utils/assets_paths.dart';
import 'package:my_bookly/core/utils/service_locator.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/new_books_list.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/new_books_item.dart';
import 'package:my_bookly/features/search/data/repos/search_repo.dart';
import 'package:my_bookly/features/search/presentation/view/widgets/search_text_field.dart';
import 'package:my_bookly/features/search/presentation/view_model/search/search_cubit.dart';
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
              BlocProvider.of<SearchCubit>(context)
                  .searchedBooks(searchedValue: value);
            },
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchSuccess) {
                return Expanded(
                  child: Column(
                    children: [
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
                      Expanded(
                        child: CustomScrollView(
                          physics: const BouncingScrollPhysics(),
                          slivers: [
                            NewBooksListWidget(
                              booksModels: state.searchedBooks,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is SearchFailure) {
                return Center(
                  child: Text(
                    state.errMessage,
                    style: Styles.textStyle18,
                  ),
                );
              } else if (state is SearchLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
