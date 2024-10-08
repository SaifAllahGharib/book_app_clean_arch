import 'package:bloc/bloc.dart';

import 'top_books_state.dart';

class TopBooksCubit extends Cubit<TopBooksState> {
  TopBooksCubit() : super(TopBooksInit());
}
