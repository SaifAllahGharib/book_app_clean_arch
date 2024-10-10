import 'package:book_app_clean_arch/core/utils/styles.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class Ratting extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final BookEntity bookEntity;

  const Ratting({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.bookEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        const SizedBox(width: 5),
        Text(
          "${bookEntity.rating}",
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        Text("(${bookEntity.ratingCount})"),
      ],
    );
  }
}
