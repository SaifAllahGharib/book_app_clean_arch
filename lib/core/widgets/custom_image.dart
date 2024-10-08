import 'package:book_app_clean_arch/core/widgets/custom_error_image_widget.dart';
import 'package:book_app_clean_arch/core/widgets/custom_placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;

  const CustomImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          placeholder: (context, url) => const CustomPlaceholder(),
          errorWidget: (context, url, error) => const CustomErrorImageWidget(),
        ),
      ),
    );
  }
}
