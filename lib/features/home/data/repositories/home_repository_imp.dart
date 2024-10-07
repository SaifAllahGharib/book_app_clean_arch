import 'package:book_app_clean_arch/core/errors/failure.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImp extends HomeRepository {
  @override
  Future<Either<Failure, List<BookEntity>>> fetchBooks({required String path}) {
    // TODO: implement fetchBooks
    throw UnimplementedError();
  }
}
