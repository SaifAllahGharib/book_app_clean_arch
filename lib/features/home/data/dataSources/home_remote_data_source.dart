import 'package:book_app_clean_arch/core/utils/api_services.dart';
import 'package:book_app_clean_arch/core/utils/functions/store_books_in_db.dart';
import 'package:book_app_clean_arch/features/home/data/models/book_model/BookModel.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';

sealed class HomeRemoteDataSource {
  Future<List<BookEntity>> fetch({required String path});
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiServices _apiServices;

  HomeRemoteDataSourceImp(this._apiServices);

  @override
  Future<List<BookEntity>> fetch({required String path}) async {
    var data = await _apiServices.get(endPoint: path);
    List<BookEntity> books = _storeData(data);
    await storeBooksInDB(books: books, path: path);
    return books;
  }

  List<BookEntity> _storeData(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var book in data["items"]) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}
