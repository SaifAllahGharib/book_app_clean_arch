import 'package:book_app_clean_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';

class Ratting extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;

  const Ratting({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
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
          "4.5",
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        const Text("(245)"),
      ],
    );
  }
}
