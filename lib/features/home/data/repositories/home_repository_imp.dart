import 'package:book_app_clean_arch/core/errors/failure.dart';
import 'package:book_app_clean_arch/features/home/data/dataSources/home_local_data_source.dart';
import 'package:book_app_clean_arch/features/home/data/dataSources/home_remote_data_source.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepositoryImp({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchBooks(
      {required String path}) async {
    try {
      var localBooks = homeLocalDataSource.fetch(path: path);
      var books = (localBooks.isEmpty)
          ? await homeRemoteDataSource.fetch(path: path)
          : localBooks;
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }
}
