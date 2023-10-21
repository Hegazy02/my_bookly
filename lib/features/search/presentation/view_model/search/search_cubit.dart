import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:my_bookly/features/search/data/repos/search_repo.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.search) : super(SearchInitial());
  final Search search;
  searchedBooks({required String searchedValue}) async {
    Either<Failure, List<BookModel>> searchedBooks = await search.searchedBooks(
      searchedValue: searchedValue,
    );
    searchedBooks.fold((failure) => emit(SearchFailure(failure.errMessage)),
        (books) => emit(SearchSuccess(searchedBooks: books)));
  }

  @override
  void onChange(Change<SearchState> change) {
    print(change);
    super.onChange(change);
  }
}
