import 'package:book_app_clean_arch/core/utils/media_query.dart';
import 'package:book_app_clean_arch/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class TopListView extends StatelessWidget {
  const TopListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyMediaQuery.getHeight(context) * 0.25,
      child: ListView.builder(
        itemCount: 7,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(top: 30, right: 10),
            child: CustomImage(),
          );
        },
      ),
    );
  }
}
