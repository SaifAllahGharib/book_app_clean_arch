import 'package:book_app_clean_arch/core/utils/styles.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/bottom_list_view.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/custom_app_bar_home_view.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/widgets/top_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarHomeView(),
          TopListViewBlocBuilder(),
          SizedBox(height: 50),
          Text(
            "Best Seller",
            style: Styles.textStyle20,
          ),
          SizedBox(height: 40),
          BottomListView(),
        ],
      ),
    );
  }
}
