import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/book_details_view.dart';
import 'package:book_app_clean_arch/features/home/presentation/views/home_view.dart';
import 'package:book_app_clean_arch/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.id,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: BookDetailsView.id,
        builder: (context, state) =>
            BookDetailsView(bookEntity: state.extra as BookEntity),
      ),
    ],
  );
}
