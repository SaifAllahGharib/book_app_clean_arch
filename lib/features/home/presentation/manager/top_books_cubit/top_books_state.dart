abstract class TopBooksState {}

class TopBooksInit extends TopBooksState {}

class TopBooksLoading extends TopBooksState {}

class TopBooksSuccess extends TopBooksState {}

class TopBooksFailure extends TopBooksState {
  final String msg;

  TopBooksFailure({required this.msg});
}
