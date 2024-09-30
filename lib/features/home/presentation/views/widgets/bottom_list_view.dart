import 'package:book_app_clean_arch/features/home/presentation/views/widgets/bottom_list_view_item.dart';
import 'package:flutter/cupertino.dart';

class BottomListView extends StatelessWidget {
  const BottomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: BottomListViewItem(),
          );
        },
      ),
    );
  }
}
