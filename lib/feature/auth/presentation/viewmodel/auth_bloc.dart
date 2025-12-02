import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/auth/domain/usecases/social_sign_in_usecase.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_event.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_state.dart';

@injectable // injectable 데코레이터 유지
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // 1. AuthRepository 대신 Use Case를 의존성으로 주입받도록 수정
  final SocialSignInUseCase _signInUseCase;

  // BLoC 초기 상태는 Unauthenticated로 설정하여 로그인 화면을 표시합니다.
  AuthBloc(this._signInUseCase) : super(const AuthState.unauthenticated()) {
    on<AuthStarted>(_onAuthStarted);
    on<SignInWithGooglePressed>(_onSignInWithGooglePressed);
    on<SignInWithKakaoPressed>(_onSignInWithKakaoPressed);
    on<SignedOut>(_onSignedOut);
  }

  // AuthStarted 이벤트 핸들러: 앱 시작 시 인증 상태 확인
  Future<void> _onAuthStarted(
    AuthStarted event,
    Emitter<AuthState> emit,
  ) async {
    // 실제로는 토큰 등을 확인하여 인증 상태를 판단합니다.
    await Future.delayed(const Duration(seconds: 1)); // 시뮬레이션
    // 현재는 무조건 로그인이 필요하다고 가정
    emit(const AuthState.unauthenticated());
  }

  // Google 로그인 버튼 이벤트 핸들러
  Future<void> _onSignInWithGooglePressed(
    SignInWithGooglePressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      // 2. 주입받은 Use Case의 메서드를 호출
      final userId = await _signInUseCase.executeGoogleSignIn();

      // 성공 시 Authenticated 상태로 전환
      emit(AuthState.authenticated(userId: userId));
    } catch (e) {
      // 실패 시 Error 상태로 전환
      emit(AuthState.error(message: 'Google 로그인 실패: $e'));
      // 에러 후 다시 로그인 화면으로 돌아가기
      emit(const AuthState.unauthenticated());
    }
  }

  // Kakao 로그인 버튼 이벤트 핸들러
  Future<void> _onSignInWithKakaoPressed(
    SignInWithKakaoPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      // 3. 주입받은 Use Case의 메서드를 호출
      final userId = await _signInUseCase.executeKakaoSignIn();

      // 성공 시 Authenticated 상태로 전환
      emit(AuthState.authenticated(userId: userId));
    } catch (e) {
      // 실패 시 Error 상태로 전환
      emit(AuthState.error(message: 'Kakao 로그인 실패: $e'));
      // 에러 후 다시 로그인 화면으로 돌아가기
      emit(const AuthState.unauthenticated());
    }
  }

  // 로그아웃 이벤트 핸들러
  Future<void> _onSignedOut(SignedOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      // 4. 주입받은 Use Case의 메서드를 호출
      await _signInUseCase.executeSignOut();

      // 로그아웃 성공 시 Unauthenticated 상태로 전환
      emit(const AuthState.unauthenticated());
    } catch (e) {
      // 로그아웃 실패 시 에러 처리
      emit(AuthState.error(message: '로그아웃 실패: $e'));
      // 기존 상태 유지 (혹은 원하는 상태로 전환)
      // emit(AuthState.authenticated(userId: '...'));
    }
  }
}
