import 'package:book_app_clean_arch/constants.dart';
import 'package:book_app_clean_arch/core/errors/failure.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/domain/useCases/fetch_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'top_books_state.dart';

class TopBooksCubit extends Cubit<TopBooksState> {
  final FetchBooksUseCase _fetchBooksUseCase;

  TopBooksCubit(this._fetchBooksUseCase) : super(TopBooksInit());

  Future<void> fetchBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(TopBooksLoading());
    } else {
      emit(TopBooksPaginationLoading());
    }
    Either<Failure, List<BookEntity>> result =
        await _fetchBooksUseCase.call(path: endPointTopBooks, p: pageNumber);

    result.fold(
      (failure) => (pageNumber == 0)
          ? emit(TopBooksFailure(msg: failure.msg))
          : emit(TopBooksPaginationFailure()),
      (books) => emit(TopBooksSuccess(books: books)),
    );
  }
}
