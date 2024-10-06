import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  final String baseUrl = "https://www.googleapis.com/books/v1/volumes/";

  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$baseUrl$endPoint");
    return response.data;
  }
}
