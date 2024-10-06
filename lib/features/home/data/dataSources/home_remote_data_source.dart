import 'package:book_app_clean_arch/features/home/domain/entities/BookEntity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchBooks({required String path});
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchBooks({required String path}) {
    throw UnimplementedError();
  }
}
