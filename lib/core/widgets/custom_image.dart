import 'package:book_app_clean_arch/core/widgets/custom_error_image_widget.dart';
import 'package:book_app_clean_arch/core/widgets/custom_placeholder.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final BookEntity bookEntity;

  const CustomImage({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: bookEntity.image!,
          placeholder: (context, url) => const CustomPlaceholder(),
          errorWidget: (context, url, error) => const CustomErrorImageWidget(),
        ),
      ),
    );
  }
}
