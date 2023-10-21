import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_bookly/core/utils/api_service.dart';
import 'package:my_bookly/features/home/data/repos/home_repo.dart';
import 'package:my_bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly/features/search/data/repos/search_repo.dart';
import 'package:my_bookly/features/search/data/repos/search_repo_impl.dart';

class ServiceLocator {
  static final getIt = GetIt.instance;
  static setup() {
    getIt.registerSingleton<HomeRepo>(
      HomeRepoImpl(
        apiService: ApiService(Dio()),
      ),
    );
    getIt.registerSingleton<Search>(
      SearchImpl(
        ApiService(Dio()),
      ),
    );
  }
}
