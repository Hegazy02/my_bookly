import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fectchNewsetBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}
