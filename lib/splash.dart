import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

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
      context.push('/');
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
