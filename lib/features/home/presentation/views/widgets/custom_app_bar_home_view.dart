import 'package:book_app_clean_arch/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CustomAppBarHomeView extends StatelessWidget {
  const CustomAppBarHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AppImages.logo,
          height: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_rounded,
            size: 27,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
