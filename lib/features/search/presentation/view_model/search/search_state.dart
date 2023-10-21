part of 'search_cubit.dart';

@immutable
sealed class SearchState {
  const SearchState();
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<BookModel> searchedBooks;
  const SearchSuccess({required this.searchedBooks});
}

final class SearchFailure extends SearchState {
  final String errMessage;
  const SearchFailure(this.errMessage);
}
