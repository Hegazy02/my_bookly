import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:my_bookly/features/search/data/repos/search_repo.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.search) : super(SearchInitial()) {
    controller.addListener(() async {
      await getMoreBooks();
    });
  }
  ScrollController controller = ScrollController();
  bool isLoadingMore = false;
  int startIndex = 0;
  String searchedValue = 'data';
  List<BookModel> allSearchedBooks = [];

  final Search search;
  searchedBooks(
      {required String searchedValue, required bool isNewList}) async {
    this.searchedValue = searchedValue;
    if (isNewList) {
      allSearchedBooks = [];
      startIndex = 0;
    }
    Either<Failure, List<BookModel>> searchedBooks = await search.searchedBooks(
        searchedValue: searchedValue, startIndex: startIndex);
    searchedBooks.fold((failure) => emit(SearchFailure(failure.errMessage)),
        (books) {
      allSearchedBooks.addAll(books);
      print("zzzzzzzzzzz");
      print("allSearchedBooks ${allSearchedBooks.length}");
      emit(SearchSuccess(searchedBooks: allSearchedBooks));
    });
  }

  getMoreBooks() async {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      isLoadingMore = true;

      startIndex += 10;
      await searchedBooks(searchedValue: searchedValue, isNewList: false);
      print("xxxxxxxxxxxxxxxx");
      print("allSearchedBooks ${allSearchedBooks.length}");
      // isLoadingMore = false;
    }
  }

  @override
  void onChange(Change<SearchState> change) {
    print(change);
    super.onChange(change);
  }
}
