import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/core/utils/api_service.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';

import 'package:my_bookly/features/search/data/repos/search_repo.dart';

class SearchImpl extends Search {
  final ApiService apiService;
  SearchImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> searchedBooks(
      {required String searchedValue, required int startIndex}) async {
    final Map data;
    List<BookModel> searchedBooks = [];
    try {
      data = await apiService.get(
          endPoint:
              'volumes?q=$searchedValue&startIndex=$startIndex&maxResults=10');
      for (var element in data['items']) {
        searchedBooks.add(BookModel.fromJson(element));
      }
      return right(searchedBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(dioException: e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
