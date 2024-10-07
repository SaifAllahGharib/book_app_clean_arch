import 'package:book_app_clean_arch/features/home/domain/entities/BookEntity.dart';

sealed class HomeLocalDataSource {
  List<BookEntity> fetchBooks({required String path});
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchBooks({required String path}) {}
}
