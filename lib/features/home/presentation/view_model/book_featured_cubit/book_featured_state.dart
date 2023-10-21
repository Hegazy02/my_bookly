import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';

abstract class BookFeaturedState {
  const BookFeaturedState();
}

class BookFeaturedInitial extends BookFeaturedState {}

class BookFeaturedLoading extends BookFeaturedState {}

class BookFeaturedSuccess extends BookFeaturedState {
  final List<BookModel> books;
  const BookFeaturedSuccess(this.books);
}

class BookFeaturedFailure extends BookFeaturedState {
  final String errMessage;

  const BookFeaturedFailure(this.errMessage);
}
