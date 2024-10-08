import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';

abstract class TopBooksState {}

class TopBooksInit extends TopBooksState {}

class TopBooksLoading extends TopBooksState {}

class TopBooksSuccess extends TopBooksState {
  final List<BookEntity> books;

  TopBooksSuccess({required this.books});
}

class TopBooksFailure extends TopBooksState {
  final String msg;

  TopBooksFailure({required this.msg});
}
