import 'package:book_app_clean_arch/constants.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

Future<void> storeBooksInDB(
    {required List<BookEntity> books, required String path}) async {
  switch (path) {
    case endPointTopBooks:
      await Hive.box<BookEntity>(topBooksDB).addAll(books);
      break;
    case endPointBottomBooks:
      await Hive.box<BookEntity>(bottomBooksDB).addAll(books);
      break;
  }
}
