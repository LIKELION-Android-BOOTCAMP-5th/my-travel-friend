import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/auth/domain/usecases/cancel_oauth_usecase.dart';

import '../../../domain/usecases/sign_out_usecase.dart';
import '../../../domain/usecases/social_sign_in_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //bloc에서 사용할 usercase 를 주입받아야함.
  final SocialSignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUseCase;
  final CancelOauthUseCase _cancelOauthUseCase;

  // BLoC 초기 상태는 Unauthenticated로 설정하여 로그인 화면을 표시
  AuthBloc(this._signInUseCase, this._signOutUseCase, this._cancelOauthUseCase)
    : super(const AuthState.unauthenticated()) {
    on<AuthStarted>(_onAuthStarted);
    on<SignInWithSocialPressed>(_onSignInWithSocialPressed);
    on<SignInCanceled>(_onSignInCanceled);
    on<SignedOut>(_onSignedOut);
  }

  // AuthStarted 이벤트 핸들러: 앱 시작 시 인증 상태 확인
  Future<void> _onAuthStarted(
    AuthStarted event,
    Emitter<AuthState> emit,
  ) async {
    ///TODO:로그인 상태 체크
  }

  //소셜 로그인 버튼 이벤트 핸들러
  Future<void> _onSignInWithSocialPressed(
    SignInWithSocialPressed event,
    Emitter<AuthState> emit,
  ) async {
    //로딩 상태로 변경
    emit(const AuthState.loading());

    //주입받은 Use Case의 메서드를 호출
    //매개변수로 이벤트에 선언한 타입을 받는다.
    final result = await _signInUseCase.call(type: event.type);
    //result결과에 따라 상태 변경
    result.when(
      success: (user) {
        //성공시 인증 상태로 변경
        emit(AuthState.authenticated(uuId: user.uuid!));
      },
      failure: (fail) {
        // 실패 시 Error 상태로 전환
        emit(AuthState.error(message: '로그인 실패: ${fail.message}'));
        // 에러 후 다시 비 인증상태
        emit(const AuthState.unauthenticated());
      },
    );
  }

  // [이재은] 로그인 중 취소 사건 발생시
  Future<void> _onSignInCanceled(
    SignInCanceled event,
    Emitter<AuthState> emit,
  ) async {
    _cancelOauthUseCase.call();
    emit(const AuthState.unauthenticated());
  }

  // 로그아웃 이벤트 핸들러
  Future<void> _onSignedOut(SignedOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      // 주입받은 Use Case의 메서드를 호출
      await _signOutUseCase.call();

      // 로그아웃 성공 시 Unauthenticated 상태로 전환
      emit(const AuthState.unauthenticated());
    } catch (e) {
      // 로그아웃 실패 시 에러 처리
      emit(AuthState.error(message: '로그아웃 실패: $e'));
    }
  }
}
