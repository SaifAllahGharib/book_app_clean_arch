import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';

abstract class BottomBooksState {}

class BottomBooksInit extends BottomBooksState {}

class BottomBooksLoading extends BottomBooksState {}

class BottomBooksPaginationLoading extends BottomBooksState {}

class BottomBooksPaginationFailure extends BottomBooksState {}

class BottomBooksSuccess extends BottomBooksState {
  final List<BookEntity> books;

  BottomBooksSuccess({required this.books});
}

class BottomBooksFailure extends BottomBooksState {
  final String msg;

  BottomBooksFailure({required this.msg});
}
