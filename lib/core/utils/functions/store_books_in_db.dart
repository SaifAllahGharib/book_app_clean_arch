import 'package:book_app_clean_arch/constants.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

Future<void> storeBooksInDB(
    {required List<BookEntity> books, required String path}) async {
  switch (path) {
    case topBooksDB:
      await Hive.box(topBooksDB).addAll(books);
    case bottomBooksDB:
      await Hive.box(bottomBooksDB).addAll(books);
  }
}
