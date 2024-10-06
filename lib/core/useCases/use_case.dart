import 'package:book_app_clean_arch/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T> {
  Future<Either<Failure, T>> call({required String path});
}
