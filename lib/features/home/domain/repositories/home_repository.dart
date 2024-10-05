import 'package:book_app_clean_arch/core/errors/failure.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/BookEntity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BookEntity>>> fetchBooks({required String path});
}
