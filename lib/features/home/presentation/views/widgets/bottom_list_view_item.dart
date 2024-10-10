import 'package:book_app_clean_arch/core/utils/media_query.dart';
import 'package:book_app_clean_arch/core/utils/styles.dart';
import 'package:book_app_clean_arch/core/widgets/custom_image.dart';
import 'package:book_app_clean_arch/core/widgets/ratting.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomListViewItem extends StatelessWidget {
  final BookEntity bookEntity;

  const BottomListViewItem({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(BookDetailsView.id, extra: bookEntity),
      child: SizedBox(
        height: 170,
        child: Row(
          children: [
            CustomImage(bookEntity: bookEntity),
            const SizedBox(width: 20),
            SizedBox(
              width: MyMediaQuery.getWidth(context) * 0.51,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bookEntity.title,
                    style: Styles.textStyle20
                        .copyWith(fontWeight: FontWeight.w400),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    bookEntity.author!,
                    style: Styles.textStyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Ratting(bookEntity: bookEntity),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
