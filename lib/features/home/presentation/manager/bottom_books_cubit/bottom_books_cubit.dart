import 'package:bloc/bloc.dart';
import 'package:book_app_clean_arch/constants.dart';
import 'package:book_app_clean_arch/core/errors/failure.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/domain/useCases/fetch_books_use_case.dart';
import 'package:dartz/dartz.dart';

import 'bottom_books_state.dart';

class BottomBooksCubit extends Cubit<BottomBooksState> {
  final FetchBooksUseCase _fetchBooksUseCase;

  BottomBooksCubit(this._fetchBooksUseCase) : super(BottomBooksInit());

  Future<void> fetchBooks() async {
    emit(BottomBooksLoading());
    Either<Failure, List<BookEntity>> result =
        await _fetchBooksUseCase.call(path: endPointBottomBooks);

    result.fold(
      (failure) => emit(BottomBooksFailure(msg: failure.msg)),
      (books) => emit(BottomBooksSuccess(books: books)),
    );
  }
}
