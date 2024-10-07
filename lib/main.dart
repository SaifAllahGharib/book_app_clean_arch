import 'package:book_app_clean_arch/constants.dart';
import 'package:book_app_clean_arch/core/utils/app_router.dart';
import 'package:book_app_clean_arch/core/utils/functions/init_hive.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(const MyApp());
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
