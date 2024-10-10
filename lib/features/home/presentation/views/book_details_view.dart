import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  static const id = "/book_details_view";
  final BookEntity bookEntity;

  const BookDetailsView({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(bookEntity: bookEntity),
      ),
    );
  }
}
