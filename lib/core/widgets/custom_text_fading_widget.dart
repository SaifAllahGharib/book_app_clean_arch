import 'package:book_app_clean_arch/core/utils/media_query.dart';
import 'package:flutter/material.dart';

class CustomTextFadingWidget extends StatelessWidget {
  final double width;

  const CustomTextFadingWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      width: MyMediaQuery.getWidth(context) * width,
      height: MyMediaQuery.getHeight(context) * 0.02,
    );
  }
}
