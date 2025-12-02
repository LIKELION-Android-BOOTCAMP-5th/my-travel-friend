import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_font.dart';

// [이재은] 소셜 로그인 버튼 위젯 생성
class LoginButton extends StatelessWidget {
  final String logoImg;
  final Color brandColor;
  final String brandName;
  final Color textColor;
  final VoidCallback? onTap;

  const LoginButton({
    super.key,
    required this.logoImg,
    required this.brandColor,
    required this.brandName,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: brandColor,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(logoImg),
              SizedBox(width: 16.0),
              Text(
                "$brandName로 로그인하기",
                style: AppFont.regular.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
