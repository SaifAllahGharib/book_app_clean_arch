import 'package:bloc/bloc.dart';
import 'package:book_app_clean_arch/core/errors/failure.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/domain/useCases/fetch_books_use_case.dart';
import 'package:dartz/dartz.dart';

import 'top_books_state.dart';

class TopBooksCubit extends Cubit<TopBooksState> {
  final FetchBooksUseCase fetchBooksUseCase;

  TopBooksCubit({required this.fetchBooksUseCase}) : super(TopBooksInit());

  Future<void> fetchBooks({required String path}) async {
    emit(TopBooksLoading());
    Either<Failure, List<BookEntity>> result =
        await fetchBooksUseCase.call(path: path);

    result.fold(
      (failure) => emit(TopBooksFailure(msg: failure.msg)),
      (books) => emit(TopBooksSuccess(books: books)),
    );
  }
}
