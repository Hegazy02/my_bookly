import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/features/home/data/repos/home_repo.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';
import 'package:dartz/dartz.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fectchFeaturedBooks() async {
    emit(NewestBooksLoading());
    Either<Failure, List<BookModel>> result =
        await homeRepo.fetchFeaturedBooks();
    result.fold(
        (failure) => emit(
              NewestBooksFailure(failure.errMessage),
            ),
        (books) => emit(NewestBooksSuccess(books)));
  }
}
