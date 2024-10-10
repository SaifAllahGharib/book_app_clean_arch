import 'package:book_app_clean_arch/core/widgets/custom_error.dart';
import 'package:book_app_clean_arch/core/widgets/loading.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/presentation/manager/top_books_cubit/top_books_cubit.dart';
import 'package:book_app_clean_arch/features/home/presentation/manager/top_books_cubit/top_books_state.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/top_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopListViewBlocConsumer extends StatefulWidget {
  const TopListViewBlocConsumer({super.key});

  @override
  State<TopListViewBlocConsumer> createState() =>
      _TopListViewBlocConsumerState();
}

class _TopListViewBlocConsumerState extends State<TopListViewBlocConsumer> {
  final List<BookEntity> books = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopBooksCubit, TopBooksState>(
      listener: (context, state) {
        if (state is TopBooksSuccess) {
          loading = false;
          books.addAll(state.books);
        }
        if (state is TopBooksPaginationLoading) {
          loading = true;
        }
      },
      builder: (context, state) {
        if (state is TopBooksSuccess ||
            state is TopBooksPaginationLoading ||
            state is TopBooksPaginationFailure) {
          return TopListView(
            books: books,
            loadingPagination: loading,
          );
        } else if (state is TopBooksFailure) {
          return CustomError(msg: state.msg);
        } else {
          return const Loading();
        }
      },
    );
  }
}
