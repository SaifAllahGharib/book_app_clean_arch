import 'package:book_app_clean_arch/core/utils/media_query.dart';
import 'package:book_app_clean_arch/core/widgets/custom_fading_widget.dart';
import 'package:book_app_clean_arch/core/widgets/custom_image_loading.dart';
import 'package:book_app_clean_arch/core/widgets/custom_text_fading_widget.dart';
import 'package:flutter/material.dart';

class BottomListViewLoading extends StatelessWidget {
  const BottomListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MyMediaQuery.getHeight(context) * 0.46,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                height: 170,
                child: Row(
                  children: [
                    const CustomImageLoading(),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: MyMediaQuery.getWidth(context) * 0.51,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextFadingWidget(width: 0.5),
                          SizedBox(height: 3),
                          CustomTextFadingWidget(width: 0.25),
                          SizedBox(height: 3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextFadingWidget(width: 0.15),
                              CustomTextFadingWidget(width: 0.15),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
