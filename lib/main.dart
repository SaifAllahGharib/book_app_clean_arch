import 'package:book_app_clean_arch/constants.dart';
import 'package:book_app_clean_arch/core/utils/app_router.dart';
import 'package:book_app_clean_arch/core/utils/functions/init_bloc_observer.dart';
import 'package:book_app_clean_arch/core/utils/functions/init_hive.dart';
import 'package:book_app_clean_arch/core/utils/service_locator.dart';
import 'package:book_app_clean_arch/features/home/data/repositories/home_repository_imp.dart';
import 'package:book_app_clean_arch/features/home/domain/useCases/fetch_books_use_case.dart';
import 'package:book_app_clean_arch/features/home/presentation/manager/bottom_books_cubit/bottom_books_cubit.dart';
import 'package:book_app_clean_arch/features/home/presentation/manager/top_books_cubit/top_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  intiBlocObserver();
  await initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TopBooksCubit(
            FetchBooksUseCase(getIt.get<HomeRepositoryImp>()),
          )..fetchBooks(),
        ),
        BlocProvider(
          create: (context) => BottomBooksCubit(
            FetchBooksUseCase(getIt.get<HomeRepositoryImp>()),
          )..fetchBooks(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: primaryColor,
          textTheme: ThemeData.dark().textTheme,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
