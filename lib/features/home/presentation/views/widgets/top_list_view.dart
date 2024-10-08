import 'package:book_app_clean_arch/core/utils/media_query.dart';
import 'package:book_app_clean_arch/core/widgets/custom_image.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class TopListView extends StatelessWidget {
  final List<BookEntity> books;

  const TopListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyMediaQuery.getHeight(context) * 0.25,
      child: ListView.builder(
        itemCount: books.length,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 30, right: 10),
            child: CustomImage(imageUrl: books[index].image!),
          );
        },
      ),
    );
  }
}
