import 'package:book_app_clean_arch/core/utils/styles.dart';
import 'package:book_app_clean_arch/core/widgets/ratting.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final BookEntity bookEntity;

  const TextSection({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          bookEntity.title,
          textAlign: TextAlign.center,
          style: Styles.textStyle30,
        ),
        const SizedBox(height: 3),
        Text(
          bookEntity.author!,
          textAlign: TextAlign.center,
          style: Styles.textStyle18,
        ),
        const SizedBox(height: 3),
        Ratting(
          mainAxisAlignment: MainAxisAlignment.center,
          bookEntity: bookEntity,
        ),
      ],
    );
  }
}
