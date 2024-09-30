import 'package:book_app_clean_arch/core/utils/media_query.dart';
import 'package:book_app_clean_arch/core/utils/styles.dart';
import 'package:book_app_clean_arch/core/widgets/custom_image.dart';
import 'package:book_app_clean_arch/core/widgets/ratting.dart';
import 'package:flutter/material.dart';

class BottomListViewItem extends StatelessWidget {
  const BottomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Row(
        children: [
          const CustomImage(),
          const SizedBox(width: 20),
          SizedBox(
            width: MyMediaQuery.getWidth(context) * 0.51,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hary boter and dofkodkf]okskdfsdkfm",
                  style: Styles.textStyle20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                const Text(
                  "J.K ksmdfkdvkm",
                  style: Styles.textStyle14,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "19.99\$",
                      style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Ratting(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
