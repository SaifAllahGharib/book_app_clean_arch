import 'package:book_app_clean_arch/core/utils/media_query.dart';
import 'package:book_app_clean_arch/core/widgets/custom_image.dart';
import 'package:book_app_clean_arch/core/widgets/loading.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/presentation/manager/top_books_cubit/top_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopListView extends StatefulWidget {
  final List<BookEntity> books;
  final bool loadingPagination;

  const TopListView({
    super.key,
    required this.books,
    required this.loadingPagination,
  });

  @override
  State<TopListView> createState() => _TopListViewState();
}

class _TopListViewState extends State<TopListView> {
  late final ScrollController _scrollController;
  static int _nextPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollControllerFun);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: MyMediaQuery.getHeight(context) * 0.25,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: widget.books.length,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30, right: 10),
                  child: CustomImage(imageUrl: widget.books[index].image!),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 20),
        (widget.loadingPagination == true) ? const Loading() : const SizedBox(),
      ],
    );
  }

  void _scrollControllerFun() {
    var currentPosition = _scrollController.position.pixels;
    var maxPosition = _scrollController.position.maxScrollExtent;

    if (currentPosition == maxPosition) {
      _fetchBooks();
    }
  }

  void _fetchBooks() async {
    await BlocProvider.of<TopBooksCubit>(context)
        .fetchBooks(pageNumber: _nextPage);
    _nextPage++;
  }
}
