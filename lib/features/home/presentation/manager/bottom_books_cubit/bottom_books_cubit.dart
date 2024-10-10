import 'package:book_app_clean_arch/constants.dart';
import 'package:book_app_clean_arch/core/errors/failure.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/domain/useCases/fetch_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_books_state.dart';

class BottomBooksCubit extends Cubit<BottomBooksState> {
  final FetchBooksUseCase _fetchBooksUseCase;

  BottomBooksCubit(this._fetchBooksUseCase) : super(BottomBooksInit());

  Future<void> fetchBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(BottomBooksLoading());
    } else {
      emit(BottomBooksPaginationLoading());
    }
    Either<Failure, List<BookEntity>> result = await _fetchBooksUseCase.call(
      path: endPointBottomBooks,
      p: pageNumber,
    );

    result.fold(
      (failure) => (pageNumber == 0)
          ? emit(BottomBooksFailure(msg: failure.msg))
          : emit(BottomBooksPaginationFailure()),
      (books) => emit(BottomBooksSuccess(books: books)),
    );
  }
}
