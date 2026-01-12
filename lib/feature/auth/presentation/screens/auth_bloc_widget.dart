import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/feature/auth/presentation/screens/auth_screen.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth/auth_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth/auth_state.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/widget/toast_pop.dart';
import '../viewmodel/auth/auth_event.dart';
import '../viewmodel/auth_profile/auth_profile_event.dart';

// [전재민]
/*
* auth_screens을 감싸는 상위 위젯. 해당위젯에서 블록으로 감싸고 auth_screen은 순수한 화면영역만을 담당한다.
* blocConsumer을 사용한이유는 builder와 listener가 있기 때문에 사용했음. 로그인 상태에 따라 다른 처리를 하기위해
* builder하위 부분의 스크린이 bloc에 따라 화면이 다시그려진다..
* ui인 auth_screen은 자신의 bloc이 어떤 bloc인지 알지 못하기 때문에 final authBloc = BlocProvider.of<AuthBloc>(context);로 찾아서 사용했습니다.
* bloc 사용시에 BlocConsumer말고도 BlocListener나 BlocBuilder도 있으니까 이건 찾아보고 사용하세요.
*/
class AuthBlocWidget extends StatefulWidget {
  const AuthBlocWidget({super.key});

  @override
  State<AuthBlocWidget> createState() => _AuthBlocWidgetState();
}

class _AuthBlocWidgetState extends State<AuthBlocWidget> {
  @override
  void initState() {
    super.initState();
    // 페이지 진입 시 AuthBloc에 AuthStarted 이벤트를 추가하여 현재 인증 상태를 확인하도록 요청
    context.read<AuthBloc>().add(const AuthEvent.authStarted());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // 1. 로그인 성공 처리 리스너
        BlocListener<AuthProfileBloc, AuthProfileState>(
          listenWhen: (prev, curr) => curr is AuthProfileAuthenticated,
          listener: (context, state) {
            state.whenOrNull(
              authenticated: (uuid, userInfo) {
                final nickname = userInfo.nickname ?? '여행자';
                ToastPop.show("로그인 성공! $nickname님 환영합니다! ✈️");
                /*Future.microtask(() {
                  context.replace('/');
                });*/
              },
            );
          },
        ),
        /*// 2. 로그아웃 완료 처리 리스너
        BlocListener<AuthProfileBloc, AuthProfileState>(
          listenWhen: (prev, curr) => curr is AuthProfileUnauthenticated,
          listener: (context, state) {
            state.whenOrNull(
              unauthenticated: () {
                print("미인증상태로 돌아감. 로그인 화면으로 이동.");
                // 로그아웃이 완료되어 Unauthenticated 상태가 된 것이므로,
                // 별도의 signedOut 이벤트를 다시 추가할 필요 없이 화면 이동만 처리
                //context.replace('/login');
              },
            );
          },
        ),*/
        // 3. AuthBloc 에러 처리 리스너
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (message) {
                ToastPop.show('인증 과정 오류 발생: $message');
              },
            );
          },
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          const AuthEvent.signInCancelled(),
                        );
                      },
                      child: const Text('로그인 취소'),
                    ),
                  ],
                ),
              ),
            );
          }
          // 로딩 상태가 아닐 때 AuthScreen 표시
          return const AuthScreen();
        },
      ),
    );
  }
}
