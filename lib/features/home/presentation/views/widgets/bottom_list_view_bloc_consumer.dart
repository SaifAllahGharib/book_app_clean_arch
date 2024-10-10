import 'package:book_app_clean_arch/core/widgets/custom_error.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/presentation/manager/bottom_books_cubit/bottom_books_cubit.dart';
import 'package:book_app_clean_arch/features/home/presentation/manager/bottom_books_cubit/bottom_books_state.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/bottom_list_view.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/bottom_list_view_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomListViewBlocConsumer extends StatefulWidget {
  const BottomListViewBlocConsumer({super.key});

  @override
  State<BottomListViewBlocConsumer> createState() =>
      _BottomListViewBlocConsumerState();
}

class _BottomListViewBlocConsumerState
    extends State<BottomListViewBlocConsumer> {
  List<BookEntity> books = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomBooksCubit, BottomBooksState>(
        listener: (context, state) {
      if (state is BottomBooksSuccess) {
        loading = false;
        books.addAll(state.books);
      }
      if (state is BottomBooksPaginationLoading) {
        loading = true;
      }
    }, builder: (context, state) {
      // return BottomListViewLoading();
      if (state is BottomBooksSuccess ||
          state is BottomBooksPaginationLoading ||
          state is BottomBooksPaginationFailure) {
        return BottomListView(books: books, paginationLoading: loading);
      } else if (state is BottomBooksFailure) {
        return CustomError(msg: state.msg);
      } else {
        return const BottomListViewLoading();
      }
    });
  }
}
