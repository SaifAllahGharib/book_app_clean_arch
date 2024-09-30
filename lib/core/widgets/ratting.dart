import 'package:flutter/material.dart';

class Ratting extends StatelessWidget {
  const Ratting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        SizedBox(width: 5),
        Text("(245)"),
      ],
    );
  }
}
