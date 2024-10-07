import 'package:book_app_clean_arch/constants.dart';
import 'package:book_app_clean_arch/core/utils/app_router.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() async {
  runApp(const MyApp());
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(booksDB);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: primaryColor,
        textTheme: ThemeData.dark().textTheme,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
