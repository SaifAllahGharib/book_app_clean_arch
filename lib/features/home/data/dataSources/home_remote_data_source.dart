import 'package:book_app_clean_arch/core/utils/api_services.dart';
import 'package:book_app_clean_arch/features/home/data/models/book_model/BookModel.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/BookEntity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchBooks({required String path});
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiServices _apiServices;

  HomeRemoteDataSourceImp(this._apiServices);

  @override
  Future<List<BookEntity>> fetchBooks({required String path}) async {
    var data = await _apiServices.get(endPoint: path);
    return _storeData(data);
  }

  List<BookEntity> _storeData(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var book in data["items"]) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}
