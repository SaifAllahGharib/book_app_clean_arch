import 'package:book_app_clean_arch/core/widgets/custom_image.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/custom_button.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/text_section.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookEntity bookEntity;

  const BookDetailsViewBody({super.key, required this.bookEntity});

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomImage(bookEntity: bookEntity),
            ),
            const SizedBox(height: 50),
            TextSection(bookEntity: bookEntity),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () async {
                try {
                  await launchUrl(Uri.parse(bookEntity.bookLink!));
                } catch (e) {
                  Fluttertoast.showToast(
                    msg: "Can't go to this URL",
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
