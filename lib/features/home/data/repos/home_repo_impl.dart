import 'package:dartz/dartz.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/features/home/data/repos/home_repo.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fectchBestSellerBooks() {
    // TODO: implement fectchBestSellerBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
