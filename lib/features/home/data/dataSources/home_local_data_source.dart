import 'package:book_app_clean_arch/constants.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

sealed class HomeLocalDataSource {
  List<BookEntity> fetch({required String path, int pageNumber = 0});
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetch({required String path, int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    Box<BookEntity> books = path == endPointTopBooks
        ? Hive.box<BookEntity>(topBooksDB)
        : Hive.box<BookEntity>(bottomBooksDB);
    int length = books.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return books.values.toList().sublist(startIndex, endIndex);
  }
}
