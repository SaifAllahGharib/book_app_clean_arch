import 'package:book_app_clean_arch/core/errors/failure.dart';
import 'package:book_app_clean_arch/features/home/data/dataSources/home_local_data_source.dart';
import 'package:book_app_clean_arch/features/home/data/dataSources/home_remote_data_source.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;

  HomeRepositoryImp(
    this._homeRemoteDataSource,
    this._homeLocalDataSource,
  );

  @override
  Future<Either<Failure, List<BookEntity>>> fetchBooks({
    required String path,
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> localBooks = _homeLocalDataSource.fetch(path: path);
      List<BookEntity> books = (localBooks.isEmpty)
          ? await _homeRemoteDataSource.fetch(path: "$path${pageNumber * 10}")
          : localBooks;
      return right(books);
    } catch (e) {
      return (e is DioException)
          ? left(ServerFailure.fromDioException(e))
          : left(ServerFailure(msg: e.toString()));
    }
  }
}
