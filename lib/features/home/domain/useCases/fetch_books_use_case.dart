import 'package:book_app_clean_arch/core/errors/failure.dart';
import 'package:book_app_clean_arch/core/useCases/use_case.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class FetchBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepository _homeRepository;

  FetchBooksUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> call({
    required String path,
    int p = 0,
  }) async {
    return await _homeRepository.fetchBooks(
      path: path,
      pageNumber: p,
    );
  }
}
