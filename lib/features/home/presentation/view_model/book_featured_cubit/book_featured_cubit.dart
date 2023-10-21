import 'package:bloc/bloc.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_featured_cubit/book_featured_state.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';

class BookFeaturedCubit extends Cubit<BookFeaturedState> {
  BookFeaturedCubit(this.homeRepo) : super(BookFeaturedInitial());
  final HomeRepo homeRepo;
  Future<void> fectchFeaturedBooks() async {
    emit(BookFeaturedLoading());
    Either<Failure, List<BookModel>> result =
        await homeRepo.fetchFeaturedBooks();
    result.fold(
        (failure) => emit(
              BookFeaturedFailure(failure.errMessage),
            ),
        (books) => emit(BookFeaturedSuccess(books)));
  }
}
