import 'package:flutter/material.dart';

class CustomErrorImageWidget extends StatelessWidget {
  const CustomErrorImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.red,
          width: 2,
        ),
      ),
      child: const Icon(
        Icons.error_outline_outlined,
        color: Colors.red,
      ),
    );
  }
}
