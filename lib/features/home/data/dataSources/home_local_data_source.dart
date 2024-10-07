import 'package:book_app_clean_arch/constants.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

sealed class HomeLocalDataSource {
  List<BookEntity> fetch({required String path});
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetch({required String path}) {
    var books = path == endPointTopBooks
        ? Hive.box<BookEntity>(topBooksDB)
        : Hive.box<BookEntity>(bottomBooksDB);
    return books.values.toList();
  }
}
