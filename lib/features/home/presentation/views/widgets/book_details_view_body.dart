import 'package:book_app_clean_arch/core/utils/styles.dart';
import 'package:book_app_clean_arch/core/widgets/custom_image.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/book_details_list_view.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/custom_button.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/text_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: CustomImage(),
            ),
            const SizedBox(height: 50),
            const TextSection(),
            const SizedBox(height: 30),
            const CustomButton(),
            const SizedBox(height: 50),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "You can also like",
                style: Styles.textStyle20,
              ),
            ),
            const SizedBox(height: 10),
            const BookDetailsListView(),
          ],
        ),
      ),
    );
  }
}
