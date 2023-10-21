import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:my_bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:my_bookly/features/home/presentation/view_model/featured_book_cubit/book_featured_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepo) : super(FeaturedBookInitial());
  final HomeRepo homeRepo;
  Future<void> fectchFeaturedBooks() async {
    emit(FeaturedBookLoading());
    Either<Failure, List<BookModel>> result =
        await homeRepo.fetchFeaturedBooks();
    result.fold(
        (failure) => emit(
              FeaturedBookFailure(failure.errMessage),
            ),
        (books) => emit(FeaturedBookSuccess(books)));
  }

  @override
  void onChange(Change<FeaturedBookState> change) {
    print(change);
    super.onChange(change);
  }
}
