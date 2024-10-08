import 'package:dio/dio.dart';

abstract class Failure {
  final String msg;

  Failure({required this.msg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.msg});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          msg: 'Connection to the server timed out. Please try again.',
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          msg: 'Sending data timed out. Please check your internet connection.',
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          msg: 'Receiving data from the server timed out. Please try again.',
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          msg: 'Invalid certificate. Please verify the certificate.',
        );
      case DioExceptionType.badResponse:
        print(e.response.toString());
        return ServerFailure.fromResponse(e.response!.statusCode, e.response);
      case DioExceptionType.cancel:
        return ServerFailure(
          msg: 'Request was cancelled. Please try again.',
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          msg:
              'Connection error occurred. Please check your network connection.',
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          msg: 'An unknown error occurred. Please try again later.',
        );
      default:
        return ServerFailure(msg: 'An unexpected error occurred.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(msg: response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure(msg: "Not found, Please try again later");
    } else if (statusCode == 500) {
      return ServerFailure(
        msg: "Internal server error, Please try again later",
      );
    } else {
      return ServerFailure(
        msg: "Opps there was an error, Please try again later",
      );
    }
  }
}
