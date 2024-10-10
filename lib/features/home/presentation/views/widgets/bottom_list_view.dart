import 'package:book_app_clean_arch/core/widgets/loading.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/presentation/manager/bottom_books_cubit/bottom_books_cubit.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/bottom_list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomListView extends StatefulWidget {
  final List<BookEntity> books;
  final bool paginationLoading;

  const BottomListView(
      {super.key, required this.books, required this.paginationLoading});

  @override
  State<BottomListView> createState() => _BottomListViewState();
}

class _BottomListViewState extends State<BottomListView> {
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
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: widget.books.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: BottomListViewItem(bookEntity: widget.books[index]),
                );
              },
            ),
          ),
          (widget.paginationLoading == true)
              ? const SizedBox(height: 30)
              : const SizedBox(height: 0),
          (widget.paginationLoading == true)
              ? const Loading()
              : const SizedBox(),
        ],
      ),
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
    await BlocProvider.of<BottomBooksCubit>(context)
        .fetchBooks(pageNumber: _nextPage++);
  }
}
