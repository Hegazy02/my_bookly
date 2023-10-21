import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/core/utils/api_service.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:my_bookly/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;
  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> fectchNewsetBooks() async {
    Map<String, dynamic> data;
    List<BookModel> books = [];
    try {
      data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&maxResults=40&q=write');
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(dioException: e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    final Map<String, dynamic> data;
    List<BookModel> books = [];
    try {
      data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&maxResults=40&q=subject:programming');
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(dioException: e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
