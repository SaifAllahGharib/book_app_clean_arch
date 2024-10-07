import 'package:book_app_clean_arch/constants.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void storeBooksInDB({required List<BookEntity> books}) {
  Hive.box(booksDB).addAll(books);
}
