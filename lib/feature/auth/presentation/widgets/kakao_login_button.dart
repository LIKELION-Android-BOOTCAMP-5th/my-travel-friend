// [이재은] 카카오 로그인 버튼 위젯 생성
// 카카오 디자인 가이드 규칙에 따라 생성함

import 'package:flutter/material.dart';

import '../../../../core/theme/app_font.dart';

class KakaoLoginButton extends StatelessWidget {
  final VoidCallback? onTap;
  const KakaoLoginButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xffFEE500),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/kakao_logo_48.png'),
              SizedBox(width: 16.0),
              Text(
                "카카오 로그인",
                textAlign: TextAlign.center,
                style: AppFont.login.copyWith(
                  color: Color(0xff000000),
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
