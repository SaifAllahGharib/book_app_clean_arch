import 'package:book_app_clean_arch/features/home/presentation/views/widgets/custom_app_bar_home_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          CustomAppBarHomeView(),
        ],
      ),
    );
  }
}
