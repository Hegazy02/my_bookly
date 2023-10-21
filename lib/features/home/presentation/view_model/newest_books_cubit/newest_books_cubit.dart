import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/features/home/data/models/new_book_model/book_model.dart';
import 'package:my_bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fectchNewestBooks() async {
    emit(NewestBooksLoading());
    Either<Failure, List<BookModel>> result =
        await homeRepo.fectchNewsetBooks();
    result.fold(
        (failure) => emit(
              NewestBooksFailure(failure.errMessage),
            ),
        (books) => emit(NewestBooksSuccess(books)));
  }

  @override
  void onChange(Change<NewestBooksState> change) {
    print(change);
    super.onChange(change);
  }
}
