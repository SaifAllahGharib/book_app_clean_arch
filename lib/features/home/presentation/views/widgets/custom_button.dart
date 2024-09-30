import 'package:book_app_clean_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      color: const Color(0xffEF8262),
      child: const Text(
        "Free Preview",
        style: Styles.textStyle18,
      ),
      onPressed: () {},
    );
  }
}
