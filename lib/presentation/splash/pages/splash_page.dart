import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istanbulguidetwo/core/config/assets/app_images.dart';
import 'package:istanbulguidetwo/presentation/auth/pages/login_page.dart';
import 'package:istanbulguidetwo/presentation/splash/bloc/splash_cubit.dart';
import 'package:istanbulguidetwo/presentation/splash/bloc/splash_state.dart';

import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/utils/app_route_animation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 0.09),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacement(
            context,
            CustomPageRoute.slideTransition(LoginPage()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: SlideTransition(
            position: _animation,
            child: Image.asset(AppImages.appLogo, height: 300, width: 300),
          ),
        ),
      ),
    );
  }
}
