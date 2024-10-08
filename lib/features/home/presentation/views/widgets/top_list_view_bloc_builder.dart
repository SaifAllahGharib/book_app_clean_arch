import 'package:book_app_clean_arch/core/widgets/custom_error.dart';
import 'package:book_app_clean_arch/core/widgets/loading.dart';
import 'package:book_app_clean_arch/features/home/presentation/manager/top_books_cubit/top_books_cubit.dart';
import 'package:book_app_clean_arch/features/home/presentation/manager/top_books_cubit/top_books_state.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/top_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopListViewBlocBuilder extends StatelessWidget {
  const TopListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopBooksCubit, TopBooksState>(
      builder: (context, state) {
        if (state is TopBooksSuccess) {
          return TopListView(books: state.books);
        } else if (state is TopBooksFailure) {
          return CustomError(msg: state.msg);
        } else {
          return const Loading();
        }
      },
    );
  }
}
