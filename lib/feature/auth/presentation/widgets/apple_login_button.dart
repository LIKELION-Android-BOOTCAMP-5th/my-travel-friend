// [이재은] 구글 로그인 버튼 위젯 생성
// 구글 디자인 가이드 규칙에 따라 생성함

import 'package:flutter/material.dart';

import '../../../../theme/app_font.dart';

class AppleLoginButton extends StatelessWidget {
  final VoidCallback? onTap;
  const AppleLoginButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xff000000),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/apple_logo.png', width: 18),
              SizedBox(width: 16.0),
              Text(
                "Apple로 로그인",
                textAlign: TextAlign.center,
                style: AppFont.login.copyWith(
                  color: Color(0xffffffff),
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
