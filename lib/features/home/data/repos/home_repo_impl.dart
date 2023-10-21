import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/core/utils/api_service.dart';
import 'package:my_bookly/features/home/data/repos/home_repo.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';

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
              'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:programming');
      for (var element in data['items']) {
        books.add(element);
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
    Map<String, dynamic> data;
    List<BookModel> books = [];
    try {
      data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
      for (var element in data['items']) {
        books.add(element);
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
