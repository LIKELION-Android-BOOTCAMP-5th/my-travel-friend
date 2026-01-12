import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth/auth_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/widgets/apple_login_button.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../domain/entities/user_entity.dart';
import '../viewmodel/auth/auth_event.dart';
import '../widgets/google_login_button.dart';
import '../widgets/kakao_login_button.dart';

// [이재은] 로그인 화면 생성
// [전재민] bloc적용
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 💡 BLoC 객체에 접근 (재사용성을 위해 변수로 선언)
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xffcaebf3),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 200,
                child: Image.asset('assets/images/title_black.png'),
              ),
              SizedBox(height: 100),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GoogleLoginButton(
                    onTap: () {
                      authBloc.add(
                        const AuthEvent.signInWithSocialPressed(
                          type: SocialLoginType.google,
                        ),
                      );
                    }, // 구글 로그인 액션 넣기
                  ),
                  SizedBox(height: 16.0),
                  AppleLoginButton(
                    onTap: () {
                      authBloc.add(
                        const AuthEvent.signInWithSocialPressed(
                          type: SocialLoginType.apple,
                        ),
                      );
                    }, // 구글 로그인 액션 넣기
                  ),
                  SizedBox(height: 16.0),
                  KakaoLoginButton(
                    onTap: () {
                      authBloc.add(
                        const AuthEvent.signInWithSocialPressed(
                          type: SocialLoginType.kakao,
                        ),
                      );
                    }, // 카카오 로그인 액션 넣기
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              Text(
                "소셜 로그인으로 편리하게 시작해보세요",
                style: AppFont.small.copyWith(color: AppColors.lessDark),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
