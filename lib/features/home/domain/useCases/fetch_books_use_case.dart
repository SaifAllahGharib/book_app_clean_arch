import 'package:book_app_clean_arch/core/errors/failure.dart';
import 'package:book_app_clean_arch/core/useCases/use_case.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/BookEntity.dart';
import 'package:book_app_clean_arch/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class FetchBooksUseCase extends UseCase<List<BookEntity>> {
  final HomeRepository homeRepository;

  FetchBooksUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, List<BookEntity>>> call({required String path}) async {
    return await homeRepository.fetchBooks(path: path);
  }
}
