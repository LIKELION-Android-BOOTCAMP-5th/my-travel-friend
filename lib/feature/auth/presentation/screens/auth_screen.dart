import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_font.dart';

import '../../../../theme/app_colors.dart';
import '../widgets/google_login_button.dart';
import '../widgets/kakao_login_button.dart';

// [이재은] 로그인 화면 생성
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xffEEF5FA),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    'assets/images/logo_Dark.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 100),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GoogleLoginButton(
                      onTap: () {}, // 구글 로그인 액션 넣기
                    ),
                    SizedBox(height: 8.0),
                    KakaoLoginButton(
                      onTap: () {}, // 카카오 로그인 액션 넣기
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  "소셜 로그인으로 편리하게 시작해보세요",
                  style: AppFont.small.copyWith(color: AppColors.lessDark),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
