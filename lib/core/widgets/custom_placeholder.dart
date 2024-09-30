import 'package:book_app_clean_arch/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CustomPlaceholder extends StatelessWidget {
  const CustomPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.placeholder,
      fit: BoxFit.fill,
    );
  }
}
