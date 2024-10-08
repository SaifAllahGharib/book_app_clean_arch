import 'package:book_app_clean_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final String msg;

  const CustomError({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        msg,
        style: Styles.textStyle18.copyWith(color: Colors.red),
        textAlign: TextAlign.center,
      ),
    );
  }
}
