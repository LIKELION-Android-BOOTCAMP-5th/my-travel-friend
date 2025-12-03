import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/screens/auth_screen.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_state.dart';

import '../../../../core/widget/toast_pop.dart';

// [전재민]
/*
* auth_screens을 감싸는 상위 위젯. 해당위젯에서 블록으로 감싸고 auth_screen은 순수한 화면영역만을 담당한다.
* blocConsumer을 사용한이유는 builder와 listener가 있기 때문에 사용했음. 로그인 상태에 따라 다른 처리를 하기위해
* builder하위 부분의 스크린이 bloc에 따라 화면이 다시그려진다..
* ui인 auth_screen은 자신의 bloc이 어떤 bloc인지 알지 못하기 때문에 final authBloc = BlocProvider.of<AuthBloc>(context);로 찾아서 사용했습니다.
* bloc 사용시에 BlocConsumer말고도 BlocListener나 BlocBuilder도 있으니까 이건 찾아보고 사용하세요.
*/

class AuthBlocWidget extends StatelessWidget {
  const AuthBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      //  Listener: 상태가 변경될 때 알림이나 네비게이션
      listener: (context, state) {
        state.whenOrNull(
          // 인증 성공 상태로 변경되면 홈 화면으로 이동
          authenticated: (userId) {
            // Navigator.of(context).pushReplacementNamed('/home');
            ToastPop.show('로그인 성공! User ID: $userId');
          },
          // 오류 상태가 되면 알림/팝업 표시
          error: (message) {
            ToastPop.show('오류 발생: $message');
          },
        );
      },
      //Builder: 상태에 따라 UI를 변경 (로딩 표시)
      //빌더 하위의 위젯이 bloc에 따라 리빌딩 되는겁니다.
      builder: (context, state) {
        return state.when(
          // BLoC의 초기/인증 안 됨/오류 상태일 때 로그인 화면 표시
          unauthenticated: () => const AuthScreen(),
          initial: () => const AuthScreen(),
          error: (message) => const AuthScreen(),

          // 로딩 상태일 때 로딩 인디케이터를 포함한 로그인 화면 표시
          loading: () => Stack(
            children: [
              const AuthScreen(),
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),

          // 인증된 상태일 때 리스너로 네비게이션 될것이기 때문에 빈 컨테이너
          authenticated: (userId) => Container(),
        );
      },
    );
  }
}
