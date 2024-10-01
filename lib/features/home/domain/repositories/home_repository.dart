import 'package:book_app_clean_arch/features/home/domain/entities/BookEntity.dart';

abstract class HomeRepository {
  Future<List<BookEntity>> fetchTopBooks();

  Future<List<BookEntity>> fetchBottomBooks();
}
