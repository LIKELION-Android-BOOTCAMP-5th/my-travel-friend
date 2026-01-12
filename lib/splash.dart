import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import 'feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';

// [이재은] 스플래시 로띠 화면
// 4초 길이
// -> 추후에 라우팅 필요함 현재는 아직 라우팅은 안 되어있음

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      /*final authState = context.read<AuthProfileBloc>().state;

      if (authState is AuthProfileAuthenticated) {
        context.go('/home');
      } else {
        context.go('/login');
      }*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF5FA),
      body: Center(
        child: Lottie.asset(
          'assets/animations/splash.json',
          width: 300,
          height: 300,
          fit: BoxFit.contain,
          repeat: true,
        ),
      ),
    );
  }
}
