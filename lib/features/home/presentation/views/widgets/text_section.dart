import 'package:book_app_clean_arch/core/utils/styles.dart';
import 'package:book_app_clean_arch/core/widgets/ratting.dart';
import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "The J bosxds",
          style: Styles.textStyle30,
        ),
        SizedBox(height: 3),
        Text(
          "Raying os sfdsdf",
          style: Styles.textStyle18,
        ),
        SizedBox(height: 3),
        Ratting(mainAxisAlignment: MainAxisAlignment.center),
      ],
    );
  }
}
