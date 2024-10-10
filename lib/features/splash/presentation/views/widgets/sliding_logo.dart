import 'package:book_app_clean_arch/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SlidingLogo extends StatelessWidget {
  final Animation<Offset> animation;

  const SlidingLogo({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SlideTransition(
          position: animation,
          child: Image.asset(AppImages.logo),
        );
      },
    );
  }
}
