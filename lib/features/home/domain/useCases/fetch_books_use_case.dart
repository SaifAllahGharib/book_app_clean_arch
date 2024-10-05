import 'package:book_app_clean_arch/core/errors/failure.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/BookEntity.dart';
import 'package:book_app_clean_arch/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class FetchBooksUseCase {
  final HomeRepository homeRepository;

  FetchBooksUseCase({required this.homeRepository});

  Future<Either<Failure, List<BookEntity>>> fetchBooks({required String path}) {
    return homeRepository.fetchBooks(path: path);
  }
}
