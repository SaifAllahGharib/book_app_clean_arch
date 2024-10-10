import 'package:book_app_clean_arch/features/home/presentation/views/home_view.dart';
import 'package:book_app_clean_arch/features/splash/presentation/views/widgets/sliding_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _initSlidingAnimation();
    _goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlidingLogo(animation: _animation),
    );
  }

  void _initSlidingAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animation = Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
        .animate(_animationController);
    _animationController.forward();
  }

  void _goToHome() {
    Future.delayed(
      const Duration(milliseconds: 1200),
      () async {
        if (mounted) {
          await GoRouter.of(context).pushReplacement(HomeView.id);
        }
      },
    );
  }
}
